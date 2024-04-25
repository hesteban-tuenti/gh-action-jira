# -*- coding: utf-8 -*-
@jira.QANOV-145986 @not_hardening
Feature: Alerts

  Actions After the Feature:
    Given the configured alerts with "[CONF:cms.alert_name]" name in CMS are deleted


  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @smoke @web
  Scenario Outline: A user can access to the Alerts management screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
      And I scroll to the element "alerts_option"
      And I click on the "alerts_option" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-152236 |
          | o2uk    | QANOV-152237 |
          | moves   | QANOV-152238 |
          | blaude  | QANOV-446796 |
          | o2de    | QANOV-579640 |

  @jira.<jira_id> @<product> @e2e @jira.cv.12.8 @manual @regression @web
  Scenario Outline: A user can access to Alerts page without alerts created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "0" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
     Then the text of the element "title" is equal to "Alerts"
      And the "reorder_alerts_button" button is not displayed
      And the text of the element "create_alert_button" is equal to "Create alert"
      And the text of the element "empty_case_title" is equal to "Alerts"
      And the text of the element "empty_case_description" is equal to "Please, create a new alert to start and view the list of alerts you have created."
      And the text of the element "empty_case_button" is equal to "Create alert"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145987 |
          | o2uk    | QANOV-145988 |
          | moves   | QANOV-145989 |
          | blaude  | QANOV-446797 |
          | o2de    | QANOV-579641 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @sanity @web
  Scenario Outline: A user can access to Alerts page with alerts already created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
     Then the text of the element "title" is equal to "Alerts"
      And the text of the element "reorder_alert_button" is equal to "Reorder alerts"
      And the text of the element "create_alert_button" is equal to "Create alert"
      And the "filter_by_name" element is displayed
      And the "filter_by_status" element is displayed
      And the "filter_by_target" element is displayed
      And the "alerts_list" list of elements is displayed
      And each item in the "alerts_list" list has the "name" field
      And each item in the "alerts_list" list has the "audiences" field
      And each item in the "alerts_list" list has the "target" field
      And each item in the "alerts_list" list has the "duration" field
      And each item in the "alerts_list" list has the "status" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145990 |
          | o2uk    | QANOV-145991 |
          | moves   | QANOV-145992 |
          | blaude  | QANOV-446798 |
          | o2de    | QANOV-579643 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @smoke @web
  Scenario Outline: A user can access to create a new alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
     Then the "Alert Overview" page is loaded
      And the text of the element "title" is equal to "Create Alert"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the "alert_id_input" element is displayed
      And the text of the element "target_page" is equal to "Target page"
      And the "target_selector" element is displayed
      And the text of the element "provider_title" is equal to "Content Provider"
      And the "new_provider" element is displayed
      And the "preconfigured_provider" element is displayed
      And the text of the element "continue_button" is equal to "Continue"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145996 |
          | o2uk    | QANOV-145997 |
          | moves   | QANOV-145998 |
          | blaude  | QANOV-446799 |
          | o2de    | QANOV-579646 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @jira.link.detects.CMS-2260 @jira.link.detects.CMS-2916
  @qa @smoke @web
  Scenario Outline: A user can access to configure the content of a new alert with a preconfigured provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "preconfigured_provider" element
      And I click on the "preconfigured_provider_selector" element
      And I click on the "preconfigured_provider_first_element" element
      And I click on the "continue_button" button
     Then the "Alert Content" page is loaded
      And the text of the element "title" is equal to "Create Alert"
      And the "save_button" element is not displayed
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "content_title" is equal to "Content"
      And the "title_input" element is displayed
      And the "description_input" element is displayed
      And the text of the element "alert_type" is equal to "Icon"
      And the element in "0" position in the "alert_type_list" list with "Informative" text is displayed
      And the element in "1" position in the "alert_type_list" list with "Warning" text is displayed
      And the element in "2" position in the "alert_type_list" list with "Error" text is displayed
      And the element in "3" position in the "alert_type_list" list with "Promotion" text is displayed
      And the "alert_type_info" element is selected
      And the text of the element "dismiss_title" is equal to "Dismiss"
      And the text of the element "action_configuration_title" is equal to "Actions"
      And the element in "0" position in the "action_configuration_list" list with "Preconfigured" text is displayed
      And the element in "1" position in the "action_configuration_list" list with "1 action" text is displayed
      And the element in "2" position in the "action_configuration_list" list with "2 actions" text is displayed
      And the "preconfigured_action" element is selected
      And the "alert_preview_image" element is displayed
      And the "alert_switch_mode" element is displayed
      And the text of the element "audientes_title" is equal to "Audience"
      And the text of the element "audiences_description" is equal to "Add one or more conditions to select the users that will see the content. If you don’t add any condition the notification will be visible to all users."
      And the "audiences_button" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145999 |
          | o2uk    | QANOV-146000 |
          | moves   | QANOV-146001 |
          | blaude  | QANOV-446800 |
          | o2de    | QANOV-579647 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can access to configure the content of a new alert with a new provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "new_provider" button
      And I click on the "continue_button" button
     Then the "Alert Content" page is loaded
      And the text of the element "title" is equal to "Create Alert"
      And the "save_button" element is not displayed
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "content_title" is equal to "Content"
      And the "title_input" element is displayed
      And the "description_input" element is displayed
      And the text of the element "alert_type" is equal to "Icon"
      And the element in "0" position in the "alert_type_list" list with "Informative" text is displayed
      And the element in "1" position in the "alert_type_list" list with "Warning" text is displayed
      And the element in "2" position in the "alert_type_list" list with "Error" text is displayed
      And the element in "3" position in the "alert_type_list" list with "Promotion" text is displayed
      And the "alert_type_info" element is selected
      And the "toggle_actions" switch is not checked
      And the text of the element "dismiss_title" is equal to "Dismiss"
      And the text of the element "audientes_title" is equal to "Audience"
      And the text of the element "audiences_description" is equal to "Add one or more conditions to select the users that will see the content. If you don’t add any condition the notification will be visible to all users."
      And the "audiences_button" element is displayed
      And the "alert_preview_image" element is displayed
      And the "alert_switch_mode" element is displayed
      And the "back_button" element is displayed
      And the "continue_button" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146002 |
          | o2uk    | QANOV-146003 |
          | moves   | QANOV-146004 |
          | blaude  | QANOV-446801 |
          | o2de    | QANOV-579648 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.14.4 @qa @regression @web
  Scenario Outline: A user can enable the Actions section during the creation of a new alert with a new provider
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "new_provider" button
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "toggle_actions" element
     Then the "action_configuration_title" element is displayed
      And the element in "0" position in the "action_configuration_list" list with "1 action" text is displayed
      And the element in "1" position in the "action_configuration_list" list with "2 actions" text is displayed
      And the "one_action" element is selected

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-370443 |
          | o2uk    | QANOV-370444 |
          | moves   | QANOV-370445 |
          | blaude  | QANOV-446802 |
          | o2de    | QANOV-579650 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can not create a new alert filling out the mandatory fields of Alert Overview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "name_error" is equal to "This field is required"
      And the text of the element "description_error" is equal to "This field is required"
      And the text of the element "target_error" is equal to "This field is required"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146005 |
          | o2uk    | QANOV-146006 |
          | moves   | QANOV-146007 |
          | blaude  | QANOV-446803 |
          | o2de    | QANOV-579651 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can not create a new alert filling out the mandatory fields of Alert Content page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "new_provider" button
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "description_error" is equal to "This field is required"
      And the text of the element "select_unit_error" is equal to "This field is required"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146008 |
          | o2uk    | QANOV-146009 |
          | moves   | QANOV-146010 |
          | blaude  | QANOV-446804 |
          | o2de    | QANOV-579652 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @smoke @web
  Scenario Outline: A user can access to preview a new alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "preconfigured_provider" element
      And I click on the "preconfigured_provider_selector" element
      And I click on the "preconfigured_provider_first_element" element
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
     Then the "Alert Preview" page is loaded
      And the text of the element "title" is equal to "Create Alert"
      And the "save_button" element is displayed
      And the "cancel_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "type_alert_value" is equal to "[CONF:cms.alert_default_alert_type]"
      And the text of the element "dismiss_value" is equal to "[CONF:cms.alert_default_dismiss]"
      And the text of the element "title_value" is equal to "[CONF:cms.alert_default_title]"
      And the text of the element "description_value" is equal to "[CONF:cms.alert_default_preconfigured_description]"
      And the text of the element "action_configuration_value" is equal to "[CONF:cms.alert_default_actions]"
      And the text of the element "alert_duration" is equal to "Duration"
      And the element in "0" position in the "alert_duration_list" list with "No specific time" text is displayed
      And the element in "1" position in the "alert_duration_list" list with "Specific time" text is displayed
      And the "create_test" element is displayed
      And the "alert_preview_image" element is displayed
      And the "alert_switch_mode" element is displayed
      And the "back_button" element is displayed
      And the "save_publish" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146011 |
          | o2uk    | QANOV-146012 |
          | moves   | QANOV-146013 |
          | blaude  | QANOV-446805 |
          | o2de    | QANOV-579654 |

  @jira.<jira_id> @<product> @e2e @jira.cv.12.8 @manual @regression @web
  Scenario Outline: A user can create an alert as a test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I fill in the "alert_id_input" field with an unique public id value
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "preconfigured_provider" element
      And I click on the "preconfigured_provider_selector" element
      And I click on the "preconfigured_provider_first_element" element
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "create_test" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa"
      And I fill in the "user_id" field with "12345678"
      And I click on the "save_test" button
     Then the "Alert Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Test has been created"
      And the "test" tab is displayed
      And the "test" tab is selected
      And the "delete_test_button" element is displayed
      And the "edit_test_button" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146014 |
          | o2uk    | QANOV-146015 |
          | moves   | QANOV-146016 |
          | blaude  | QANOV-446806 |
          | o2de    | QANOV-579655 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.1 @manual @regression @web
  Scenario Outline: A user can edit an alert test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "edit_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "description" field with "test qa 2"
      And I click on the "save_test" button
     Then the "Alert Preview" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-189598 |
          | o2uk    | QANOV-189599 |
          | moves   | QANOV-189600 |
          | blaude  | QANOV-446807 |
          | o2de    | QANOV-579656 |

  @jira.<jira_id> @<product> @e2e @jira.cv.12.8 @manual @regression @web
  Scenario Outline: A user can delete an alert test
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED_TEST,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "delete_test_button" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "confirm" button
      And the "Alert Overview" page is loaded
     Then the text of the element "confirm_message" is equal to "Test deleted"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146017 |
          | o2uk    | QANOV-146018 |
          | moves   | QANOV-146019 |
          | blaude  | QANOV-446808 |
          | o2de    | QANOV-579657 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can cancel the edition of an alert from Alert Overview page when there is nothing to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "name" field on the "any" element in the "alerts_list" web list
      And the "Alert Overview" page is loaded
      And I click on the "cancel_button" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146020 |
          | o2uk    | QANOV-146021 |
          | moves   | QANOV-146022 |
          | blaude  | QANOV-446809 |
          | o2de    | QANOV-579659 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can cancel the edition of an alert from Alert Content page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "name" field on the "any" element in the "alerts_list" web list
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "cancel_button" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146023 |
          | o2uk    | QANOV-146024 |
          | moves   | QANOV-146025 |
          | blaude  | QANOV-446810 |
          | o2de    | QANOV-579661 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can cancel the edition of an alert from Alert Preview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "name" field on the "any" element in the "alerts_list" web list
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "cancel_button" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146026 |
          | o2uk    | QANOV-146027 |
          | moves   | QANOV-146028 |
          | blaude  | QANOV-446811 |
          | o2de    | QANOV-579662 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @regression @web
  Scenario Outline: A user can see a popup when closing the edition of an alert from Alert Overview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I fill in the "description_input" field with "test"
      And I click on the "cancel_button" button
     Then the "Confirm Changes Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "confirm" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Alert Overview" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176699 |
          | o2uk    | QANOV-176700 |
          | moves   | QANOV-176701 |
          | blaude  | QANOV-446812 |
          | o2de    | QANOV-579663 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @regression @web
  Scenario Outline: A user can see a popup when closing the edition of an alert from Alert Content page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I fill in the "description_input" field with "test"
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "cancel_button" button
     Then the "Confirm Changes Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "confirm" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Alert Content" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176702 |
          | o2uk    | QANOV-176703 |
          | moves   | QANOV-176704 |
          | blaude  | QANOV-446813 |
          | o2de    | QANOV-579676 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @regression @web
  Scenario Outline: A user can see a popup when closing the edition of an alert from Alert Preview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I fill in the "description_input" field with "test"
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "cancel_button" button
     Then the "Confirm Changes Popup" page is loaded
      And the text of the element "title" is equal to "Are you sure you want to leave without saving?"
      And the text of the element "confirm" is equal to "Yes, leave"
      And the text of the element "cancel" is equal to "No, go back"
      And I click on the "cancel" button
      And the "Alert Preview" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176705 |
          | o2uk    | QANOV-176706 |
          | moves   | QANOV-176707 |
          | blaude  | QANOV-446814 |
          | o2de    | QANOV-579678 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @regression @web
  Scenario Outline: A user can close the edition of an alert from Alert Overview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I fill in the "description_input" field with "test"
      And I click on the "cancel_button" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "confirm" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176708 |
          | o2uk    | QANOV-176709 |
          | moves   | QANOV-176710 |
          | blaude  | QANOV-446815 |
          | o2de    | QANOV-579679 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @regression @web
  Scenario Outline: A user can close the edition of an alert from Alert Content page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I fill in the "description_input" field with "test"
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "cancel_button" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "confirm" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176711 |
          | o2uk    | QANOV-176712 |
          | moves   | QANOV-176713 |
          | blaude  | QANOV-446816 |
          | o2de    | QANOV-579680 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @regression @web
  Scenario Outline: A user can close the edition of an alert from Alert Preview page when there are changes to save
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I fill in the "description_input" field with "test"
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "cancel_button" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "confirm" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176714 |
          | o2uk    | QANOV-176715 |
          | moves   | QANOV-176716 |
          | blaude  | QANOV-446817 |
          | o2de    | QANOV-579682 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can go back to Alert Content page from Alert Preview page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "name" field on the "any" element in the "alerts_list" web list
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "back_button" button
     Then the "Alert Content" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146029 |
          | o2uk    | QANOV-146030 |
          | moves   | QANOV-146031 |
          | blaude  | QANOV-446818 |
          | o2de    | QANOV-579683 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can go back to Alert Overview page from Alert Content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the "name" field on the "any" element in the "alerts_list" web list
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "back_button" button
     Then the "Alert Overview" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146032 |
          | o2uk    | QANOV-146033 |
          | moves   | QANOV-146034 |
          | blaude  | QANOV-446819 |
          | o2de    | QANOV-579684 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @smoke @web
  Scenario Outline: A user can create a Preconfigured alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I fill in the "alert_id_input" field with an unique public id value
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "preconfigured_provider" element
      And I click on the "preconfigured_provider_selector" element
      And I click on the "preconfigured_provider_first_element" element
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Draft saved correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146035 |
          | o2uk    | QANOV-146036 |
          | moves   | QANOV-146037 |
          | blaude  | QANOV-446820 |
          | o2de    | QANOV-579697 |

  @jira.<jira_id> @<product> @e2e @jira.cv.12.8 @manual @smoke @web
  Scenario Outline: A user can create a alert configured by CMS without audience
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I fill in the "alert_id_input" field with an unique public id value
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "new_provider" element
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Draft saved correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-181448 |
          | o2uk    | QANOV-181449 |
          | moves   | QANOV-181450 |
          | blaude  | QANOV-446821 |
          | o2de    | QANOV-579701 |

  @jira.<jira_id> @<product> @e2e @jira.cv.12.8 @manual @smoke @web
  Scenario Outline: A user can create a alert configured by CMS with audience
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I fill in the "alert_id_input" field with an unique public id value
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "new_provider" element
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "audience_selector" element
      And I click on the "audience_selector_first_element" button
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Draft saved correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-181451 |
          | o2uk    | QANOV-181452 |
          | moves   | QANOV-181453 |
          | blaude  | QANOV-446822 |
          | o2de    | QANOV-579702 |

  @jira.<jira_id> @<product> @e2e @jira.cv.13.0 @manual @qa @regression @web
  Scenario Outline: A user can see a button to publish an alert when there is no content saved
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT,UNPUBLISHED,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
     Then the "publish" button is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176717 |
          | o2uk    | QANOV-176718 |
          | moves   | QANOV-176719 |
          | blaude  | QANOV-446823 |
          | o2de    | QANOV-579703 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can include a closing icon in an alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I enable the "toggle_dismissable" switch
      And I click on the "select_unit" element
      And I click on the "any" element in the "select_unit_list" list
      And I click on the "view_alert_again" element
      And I click on the "any" element in the "view_alert_again_list" list
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" contains "correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146053 |
          | o2uk    | QANOV-146054 |
          | moves   | QANOV-146055 |
          | blaude  | QANOV-446824 |
          | o2de    | QANOV-579706 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can change the type of the alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I scroll to the element "alert_type"
      And I click on the "any" element in the "alert_type_list" list
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" contains "correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146056 |
          | o2uk    | QANOV-146057 |
          | moves   | QANOV-146058 |
          | blaude  | QANOV-446825 |
          | o2de    | QANOV-579707 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can add specified time to the alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "specified_time_button" web button
      And I click on the "end_date" element
      And I fill in the "end_date" calendar cms field with "2" days from today
      And I click on the "start_date" element
      And I fill in the "start_date" calendar cms field with "1" days from today
      And waits until the "save_button" element is visible
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" contains "correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146059 |
          | o2uk    | QANOV-146060 |
          | moves   | QANOV-146061 |
          | blaude  | QANOV-446826 |
          | o2de    | QANOV-579709 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can add one action with preconfigured url to the alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "one_action" element
      And waits until the "text_action1" element is visible
      And I scroll to the element "text_action1"
      And I replace the "text_action1" field value with "Action1"
      And I click on the "action_navigation_selector" web button
      And I click on the "action_navigation_preconfigured" element
      And I click on the "url_preconfigured_selector" element
      And I wait "1" seconds
      And I click on the "1" element in the "url_preconfigured_list" list
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" contains "correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146062 |
          | o2uk    | QANOV-146063 |
          | moves   | QANOV-146064 |
          | blaude  | QANOV-446827 |
          | o2de    | QANOV-579710 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can add one action with a custom url to the alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "one_action" element
      And I scroll to the element "text_action1"
      And I replace the "text_action1" field value with "Action1"
      And I click on the "action_navigation_selector" web button
      And I click on the "action_navigation_url" element
      And I replace the "web_address1" field value with "https://www.google.es"
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" contains "correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146065 |
          | o2uk    | QANOV-146066 |
          | moves   | QANOV-146067 |
          | blaude  | QANOV-446828 |
          | o2de    | QANOV-579712 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can add two actions to the alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I click on the "two_actions" button
      And I scroll to the element "text_action1"
      And I replace the "text_action1" field value with "Action1"
      And I replace the "web_address1" field value with "https://www.google.es"
      And I scroll to the element "text_action2"
      And I replace the "text_action2" field value with "Action2"
      And I replace the "web_address2" field value with "https://www.movistar.es"
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" contains "correctly"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146068 |
          | o2uk    | QANOV-146069 |
          | moves   | QANOV-146070 |
          | blaude  | QANOV-446829 |
          | o2de    | QANOV-579715 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @smoke @web
  Scenario Outline: A user can save and publish an alert from the preview alert page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "create_alert_button" button
      And the "Alert Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.alert_name]"
      And I fill in the "description_input" field with "Automatic test - Description"
      And I fill in the "alert_id_input" field with an unique public id value
      And I click on the "target_selector" element
      And I click on the "target_page_first_element" element
      And I click on the "preconfigured_provider" element
      And I click on the "preconfigured_provider_selector" element
      And I click on the "preconfigured_provider_first_element" element
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "save_publish" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Alert has been published"
      And the "pause_button" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146044 |
          | o2uk    | QANOV-146045 |
          | moves   | QANOV-146046 |
          | blaude  | QANOV-446830 |
          | o2de    | QANOV-579716 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can pause a published alert from the alerts list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED,PUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_table" element is visible
      And I click on the "more_options" element on the configured alert
      And I click on the "menu_pause_button" element
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alerts" page is loaded
      And waits until the "alerts_list" list is stable
     Then the item with "[CONTEXT:cms_alerts.alert0.metadata.publicId]" text in "name" field in the "alerts_list" list has the "status" field with "PAUSED" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146050 |
          | o2uk    | QANOV-146051 |
          | moves   | QANOV-146052 |
          | blaude  | QANOV-446831 |
          | o2de    | QANOV-579719 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can publish an alert from the alerts list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "UNPUBLISHED,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_table" element is visible
      And I click on the "more_options" element on the configured alert
      And I click on the "menu_publish_button" element
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alerts" page is loaded
      And I refresh the browser
      And the "Alerts" page is loaded
      And waits until the "alerts_table" element is visible
     Then the item with "[CONTEXT:cms_alerts.alert0.metadata.publicId]" text in "name" field in the "alerts_list" list has the "status" field with "PUBLISHED" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146047 |
          | o2uk    | QANOV-146048 |
          | moves   | QANOV-146049 |
          | blaude  | QANOV-446832 |
          | o2de    | QANOV-579720 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can show an alert again for all users
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED,PUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_table" element is visible
      And I click on the "more_options" element on the configured alert
      And I click on the "menu_show_again_button" button
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" button
      And the "Alerts" page is loaded
     Then the text of the element "confirm_message" is equal to "Alert has been reopened"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146074 |
          | o2uk    | QANOV-146075 |
          | moves   | QANOV-146076 |
          | blaude  | QANOV-446833 |
          | o2de    | QANOV-579722 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.13.0 @qa @smoke @web
  Scenario Outline: A user can pause an alert from the preview alert page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "PUBLISHED,PUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the configured alert
      And the "Alert Overview" page is loaded
      And I click on the "continue_button" button
      And the "Alert Content" page is loaded
      And I disable the "toggle_dismissable" switch
      And I click on the "continue_button" button
      And the "Alert Preview" page is loaded
      And I click on the "pause_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Alert Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Alert has been paused"
      And the "pause_button" element is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-176720 |
          | o2uk    | QANOV-176721 |
          | moves   | QANOV-176722 |
          | blaude  | QANOV-446834 |
          | o2de    | QANOV-579723 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can delete an existing alert
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are alerts in any of "DRAFT,UNPUBLISHED,UNPUBLISHED_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And waits until the "alerts_table" element is visible
      And I click on the "more_options" element on the configured alert
      And I click on the "menu_delete_button" element
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And I click on the "accept" button
      And the "Alerts" page is loaded
      And I refresh the browser
      And the "Alerts" page is loaded
      And waits until the "alerts_table" element is visible
     Then the item with "[CONTEXT:cms_alerts.alert0.metadata.publicId]" text in "name" field in the "alerts_list" list is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146071 |
          | o2uk    | QANOV-146072 |
          | moves   | QANOV-146073 |
          | blaude  | QANOV-446835 |
          | o2de    | QANOV-579725 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can access the Reorder alerts page when there are several alerts targets
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
      And there are "several" alerts targets configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "reorder_alert_button" button
      And the "Alerts Reorder" page is loaded
      And I click on the "filter_target_selector" button
      And I click on the "target_selector_first_item" button
     Then the text of the element "save_order" is equal to "Save order"
      And waits until the "alerts_table" element is visible
      And the "alerts_table" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146077 |
          | o2uk    | QANOV-146078 |
          | moves   | QANOV-146079 |
          | blaude  | QANOV-446836 |
          | o2de    | QANOV-579727 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.14.9 @qa @regression @web
  Scenario Outline: A user can access the Reorder alerts page when there is only one alert target
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
      And there is "1" alert target configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "reorder_alert_button" button
     Then the "Alerts Reorder" page is loaded
      And the text of the element "save_order" is equal to "Save order"
      And the "alerts_table" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-603271 |
          | o2uk    | QANOV-603272 |
          | moves   | QANOV-603273 |
          | blaude  | QANOV-603274 |
          | o2de    | QANOV-603275 |

  @jira.<jira_id> @<product> @e2e @jira.cv.12.8 @manual @regression @web
  Scenario Outline: A user can reorder the alerts
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS for automation tests
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "reorder_alert_button" button
      And the "Alerts Reorder" page is loaded
      And I click on the "filter_target_selector" element
      And I click on the "any" element in the "target_list" list
      And I reorder the alerts
      And I click on the "save_order" button
      And the "Confirm Changes Popup" page is loaded
      And I click on the "confirm" button
      And the "Reorder Alerts" page is loaded
     Then the text of the element "confirm_message" is equal to "Alerts sorted successfully."
      And the "alerts_list" list has the new order

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146080 |
          | o2uk    | QANOV-146081 |
          | moves   | QANOV-146082 |
          | blaude  | QANOV-446837 |
          | o2de    | QANOV-579728 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can go to Alerts list from Reorder page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "reorder_alert_button" button
      And the "Alerts Reorder" page is loaded
      And I click on the "cancel_button" button
     Then the "Alerts" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-146083 |
          | o2uk    | QANOV-146084 |
          | moves   | QANOV-146085 |
          | blaude  | QANOV-446838 |
          | o2de    | QANOV-579730 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can filter by name in the Alerts page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I fill in the "filter_by_name" field with "\"[CONTEXT:cms_alerts.alert0.metadata.internalName]\""
      And waits until the "alerts_list" list is stable
     Then each element in the "alerts_list" list has the "name" field that contains "[CONTEXT:cms_alerts.alert0.metadata.internalName]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145993 |
          | o2uk    | QANOV-152250 |
          | moves   | QANOV-152251 |
          | blaude  | QANOV-446839 |
          | o2de    | QANOV-579732 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can filter by status in the Alerts page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "filter_by_status" element
      And I click on the element with "PUBLISHED" value in "data-value" attribute in the "filter_elements" list
      And waits until the "alerts_list" list is stable
     Then each element in the "alerts_list" list has the "status" field with "Published" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145994 |
          | o2uk    | QANOV-152252 |
          | moves   | QANOV-152253 |
          | blaude  | QANOV-446840 |
          | o2de    | QANOV-579734 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.8 @qa @regression @web
  Scenario Outline: A user can filter by target in the Alerts page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" alerts configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.alerts]" web page
      And the "Alerts" page is loaded
      And I click on the "filter_by_target" element
      And I click on the element with "[CONTEXT:cms_alerts.alert0.metadata.targetPage]" value in "data-value" attribute in the "filter_elements" list
      And waits until the "alerts_list" list is stable
     Then each element in the "alerts_list" web list has the "target" field with "[CONTEXT:cms_alerts.alert0.metadata.targetPage]" value

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-145995 |
          | o2uk    | QANOV-152254 |
          | moves   | QANOV-152255 |
          | blaude  | QANOV-446841 |
          | o2de    | QANOV-579736 |

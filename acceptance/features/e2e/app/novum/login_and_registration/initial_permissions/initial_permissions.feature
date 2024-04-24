# -*- coding: utf-8 -*-
@jira.QANOV-68851
Feature: Initial Permissions


  @jira.QANOV-68852 @android @jira.cv.12.2 @manual @mobile @o2uk @sanity @har
  Scenario: A o2uk user is informed about which features require initial permissions
    Given the device version is "lower" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.spatialbuzz_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.spatialbuzz_disclaimer_description]" text
      And the element in "2" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-287391 @android @jira.cv.13.10 @manual @mobile @o2uk @smoke @har
  Scenario: A o2uk user, with Android version 13 or greater, is informed about which features require initial permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.spatialbuzz_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.spatialbuzz_disclaimer_description]" text
      And the element in "2" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "3" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-129636 @android @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-132965
  @jira.link.parent_test_plan.QANOV-170844 @manual @mobile @sanity @vivobr @har @old_app
  Scenario: A vivobr user is informed about which features require initial permissions
    The order of the messages is not relevant, as each user can see them in a different order.
    This scenario is automated but we need to change the execution mode because Axiros changes
    will appear in the 13.0 version.
    Given the device version is "lower" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "2" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.location_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.location_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-525531 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @sanity
  @vivobr @har
  Scenario: A vivobr user is informed about which features require initial permissions
    Given the device version is "lower" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "2" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.location_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.location_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-287392 @android @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-132965
  @jira.link.parent_test_plan.QANOV-170844 @manual @mobile @sanity @vivobr @har
  Scenario: A vivobr user, with Android version 13 or greater, is informed about which features require initial permissions
    The order of the messages is not relevant, as each user can see them in a different order.
    This scenario is automated but we need to change the execution mode because Axiros changes
    will appear in the 13.0 version.
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "2" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.location_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.location_disclaimer_description]" text
      And the element in "3" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-68854 @android @jira.cv.12.2 @manual @mobile @moves @sanity @har
  Scenario: A moves user is informed about which features require initial permissions
    Given the device version is "lower" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-287393 @android @jira.cv.13.10 @manual @mobile @moves @sanity @har
  Scenario: A moves user, with Android version 13 or greater, is informed about which features require initial permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.connectivity_diagnostics_disclaimer_description]" text
      And the element in "3" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @smoke @har
  Scenario Outline: A <product> user, with Android version 13 or greater, is informed about which features require initial permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | Future | QANOV-287395 |
          | o2de    | Future | QANOV-287396 |

  @jira.QANOV-68860 @android @jira.cv.12.2 @manual @mobile @o2uk @regression
  Scenario: A o2uk user can access to extra information about permissions
    Given the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "optimize_network_title" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_title]" text is displayed
      And the "optimize_network_body" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_description]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-287397 @android @jira.cv.13.10 @manual @mobile @o2uk @regression
  Scenario: A o2uk user, with Android version 13 or greater, can access to extra information about permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "optimize_network_title" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_title]" text is displayed
      And the "optimize_network_body" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_description]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "notifications_title" textfield with "[LANG:launch_app.detail_permission.notifications_detail_title]" text is displayed
      And the "notifications_body" textfield with "[LANG:launch_app.detail_permission.notifications_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-129637 @android @jira.cv.12.7 @jira.link.depends_on.QANOV-129636 @jira.link.parent_test_plan.QANOV-132965
  @jira.link.parent_test_plan.QANOV-170844 @manual @mobile @regression @vivobr @old_app @har
  Scenario: A vivobr user can access to extra information about permissions
    The order of the messages is not relevant, as each user can see them in a different order.
    This scenario is automated but we need to change the execution mode because Axiros changes
    will appear in the 13.0 version.
    Given the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "optimize_network_title" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_title]" text is displayed
      And the "optimize_network_body" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_description]" text is displayed
      And the "location_title" textfield with "[LANG:launch_app.detail_permission.location_detail_title]" text is displayed
      And the "location_body" textfield with "[LANG:launch_app.detail_permission.location_detail_description]" text is displayed
      And the "biometrics_title" textfield with "[LANG:launch_app.detail_permission.biometrics_detail_title]" text is displayed
      And the "biometrics_body" textfield with "[LANG:launch_app.detail_permission.biometrics_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-525532 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression
  @vivobr @har
  Scenario: A vivobr user can access to extra information about permissions
    The order of the messages is not relevant, as each user can see them in a different order.
    This scenario is automated but we need to change the execution mode because Axiros changes
    will appear in the 13.0 version.
    Given the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the header is empty
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_title]" text is displayed
      And the "subtitle" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "optimize_network_title" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_title]" text is displayed
      And the "optimize_network_body" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_description]" text is displayed
      And the "location_title" textfield with "[LANG:launch_app.detail_permission.location_detail_title]" text is displayed
      And the "location_body" textfield with "[LANG:launch_app.detail_permission.location_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-287398 @android @jira.cv.13.10 @jira.link.depends_on.QANOV-129636 @jira.link.parent_test_plan.QANOV-132965
  @jira.link.parent_test_plan.QANOV-170844 @manual @mobile @regression @vivobr @old_app
  Scenario: A vivobr user, with Android version 13 or greater, can access to extra information about permissions
    The order of the messages is not relevant, as each user can see them in a different order.
    This scenario is automated but we need to change the execution mode because Axiros changes
    will appear in the 13.0 version.
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "optimize_network_title" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_title]" text is displayed
      And the "optimize_network_body" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_description]" text is displayed
      And the "location_title" textfield with "[LANG:launch_app.detail_permission.location_detail_title]" text is displayed
      And the "location_body" textfield with "[LANG:launch_app.detail_permission.location_detail_description]" text is displayed
      And the "biometrics_title" textfield with "[LANG:launch_app.detail_permission.biometrics_detail_title]" text is displayed
      And the "biometrics_body" textfield with "[LANG:launch_app.detail_permission.biometrics_detail_description]" text is displayed
      And the "notifications_title" textfield with "[LANG:launch_app.detail_permission.notifications_detail_title]" text is displayed
      And the "notifications_body" textfield with "[LANG:launch_app.detail_permission.notifications_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-525533 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression
  @vivobr
  Scenario: A vivobr user, with Android version 13 or greater, can access to extra information about permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_title]" text is displayed
      And the "subtitle" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "optimize_network_title" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_title]" text is displayed
      And the "optimize_network_body" textfield with "[LANG:launch_app.detail_permission.optimize_network_detail_description]" text is displayed
      And the "location_title" textfield with "[LANG:launch_app.detail_permission.location_detail_title]" text is displayed
      And the "location_body" textfield with "[LANG:launch_app.detail_permission.location_detail_description]" text is displayed
      And the "notifications_title" textfield with "[LANG:launch_app.detail_permission.notifications_detail_title]" text is displayed
      And the "notifications_body" textfield with "[LANG:launch_app.detail_permission.notifications_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-68862 @android @jira.cv.12.2 @manual @mobile @moves @regression
  Scenario: A moves user can access to extra information about permissions
    Given the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-287399 @android @jira.cv.13.10 @manual @mobile @moves @regression
  Scenario: A moves user, with Android version 13 or greater, can access to extra information about permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "connectivity_title" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_title]" text is displayed
      And the "connectivity_body" textfield with "[LANG:launch_app.detail_permission.connectivity_diagnostics_detail_description]" text is displayed
      And the "notifications_title" textfield with "[LANG:launch_app.detail_permission.notifications_detail_title]" text is displayed
      And the "notifications_body" textfield with "[LANG:launch_app.detail_permission.notifications_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user, with Android version 13 or greater, can access to extra information about permissions
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "notifications_title" textfield with "[LANG:launch_app.detail_permission.notifications_detail_title]" text is displayed
      And the "notifications_body" textfield with "[LANG:launch_app.detail_permission.notifications_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-287395 | QANOV-287404 |
          | o2de    | Future | QANOV-287396 | QANOV-287405 |

  @jira.<jira_id> @<product> @android @manual @jira.cv.12.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-537945 @mobile @smoke @har
  Scenario Outline: A <product> user can close basic permission screen
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Basic Permissions" page is not displayed
      And the "Permissions Popup" popup is displayed

    Examples:
          | product | depends_on              | parent_test_plan | jira_id     |
          | moves   | QANOV-68854:QANOV-68855 |                  | QANOV-68857 |
          | o2uk    | QANOV-68852             |                  | QANOV-68858 |
          | vivobr  | QANOV-129636            | QANOV-537945     | QANOV-68859 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke @har
  Scenario Outline: A <product> user can close basic permission screen
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the "button" button
     Then the "Basic Permissions" page is not displayed
      And the "Permissions Popup" popup is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-287395 | QANOV-287406 |
          | o2de    | Future | QANOV-287396 | QANOV-287407 |

  @jira.QANOV-68866 @android @automation.hard @jira.cv.12.2 @manual @mobile @moves @smoke @har
  Scenario: A moves user can accept the initial permissions
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "greater" than "7.0"
      And the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que Mi Movistar acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que Mi Movistar haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-287409 @android @jira.cv.13.10 @manual @mobile @moves @smoke @har
  Scenario: A moves user, with Android version 13 or greater, can accept the initial permissions
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que Mi Movistar acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que Mi Movistar haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Mi Movistar te envíe notificaciones?" text is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-68867 @android @automation.hard @jira.cv.12.2 @manual @mobile @moves @smoke @har
  Scenario: A moves user can accept the initial permissions
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "lower" than "8.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the "¿Permitir a Mi Movistar acceder a tus contactos?|¿Permitir a Mi Movistar acceder a llamadas telefónicas?|¿Permitir a Mi Movistar hacer y administrar llamadas de teléfono?" format is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the "¿Permitir a Mi Movistar acceder a tus contactos?|¿Permitir a Mi Movistar acceder a llamadas telefónicas?|¿Permitir a Mi Movistar hacer y administrar llamadas de teléfono?" format is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-68868 @android @automation.hard @jira.cv.12.2 @manual @mobile @o2uk @smoke @har
  Scenario: A o2uk user can accept the initial permissions in android version greater than 10
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "greater" than "10.0"
      And the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "Solo si la aplicación está en uso" text
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_settings]" text
      And the "Location" page is displayed
      And clicks on the "allow_always" radio button
      And clicks on the native "back" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-287410 @android @automation.hard @jira.cv.13.10 @manual @mobile @o2uk @smoke @har
  Scenario: A o2uk user, with Android version 13 or greater, can accept the initial permissions in android version greater than 10
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 te envíe notificaciones?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que My O2 acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "Solo si la aplicación está en uso" text
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_settings]" text
      And the "Location" page is displayed
      And clicks on the "allow_always" radio button
      And clicks on the native "back" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-68869 @android @automation.hard @jira.cv.12.2 @manual @mobile @o2uk @smoke @har
  Scenario: A o2uk user can accept the initial permissions in android version 10
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "equal" to "10.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que My O2 acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que My O2 haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with "[LANG:launch_app.background_location.text]" text is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_ok]" text
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que My O2 acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "PERMITIR SIEMPRE" text
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-68870 @android @automation.hard @jira.cv.12.2 @manual @mobile @o2uk @smoke @har
  Scenario: A o2uk user can accept the initial permissions in android version lower than 10
    internal_checkpoint="Native permissions popups, will display the texts in device language.
    Depending on the device the permission popups could be displayed in different order"
    Given the device version is "lower" than "10.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the "¿Permitir a My O2 acceder a tus contactos?|¿Permitir a My O2 acceder a llamadas telefónicas?|¿Permitir a My O2 hacer y administrar llamadas de teléfono?" format is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the "¿Permitir a My O2 acceder a tus contactos?|¿Permitir a My O2 acceder a llamadas telefónicas?|¿Permitir a My O2 hacer y administrar llamadas de teléfono?" format is displayed
      And clicks on the "popup.accept" button
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_ok]" text
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir a My O2 acceder a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "PERMITIR" text
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-68871 @android @automation.hard @jira.cv.12.2 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @sanity @vivobr @har
  Scenario: A vivobr user can accept the initial permissions in android version greater than 10
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "greater" than "10.0"
      And the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "Solo si la aplicación está en uso" text
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_settings]" text
      And the "Location" page is displayed
      And clicks on the "allow_always" radio button
      And clicks on the native "back" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-287411 @android @automation.hard @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @sanity @vivobr @har
  Scenario: A vivobr user, with Android version 13 or greater, can accept the initial permissions in android version greater than 10
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo te envíe notificaciones?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "Solo si la aplicación está en uso" text
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_settings]" text
      And the "Location" page is displayed
      And clicks on the "allow_always" radio button
      And clicks on the native "back" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-129638 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-132965 @jira.link.parent_test_plan.QANOV-537945
  @manual @mobile @smoke @vivobr @har
  Scenario: A vivobr user can accept the location permissions in ios device
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given user just installed the application
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.text" textfield with "Permite que a gente identifique a qualidade da sua rede pra que você tenha melhorias em velocidade de internet, área de cobertura, por exemplo e valida o comportamento do evento para detectar se é seguro." text is displayed
      And clicks on the "popup.accept" button with "Permitir al usarse la app" text
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-525534 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile
  @no_automatable @smoke @vivobr @har
  Scenario: A vivobr user can accept the notification permissions in ios device
    Native permissions popups, will display the texts in device language
    Given user just installed the application
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "Vivo quiere enviarte notificaciones" text is displayed
      And the "popup.message" textfield with "As notificações podem ser alertas, sons e emblemas, e podem ser configuradas nas Definições." text is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-525535 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @smoke @vivobr @har
  Scenario: A vivobr user can cancel the notification permissions in ios device
    Native permissions popups, will display the texts in device language
    Given user just installed the application
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "Vivo quiere enviarte notificaciones" text is displayed
      And clicks on the "popup.cancel" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-525536 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-537945 @manual @no_automatable @har
  @mobile @smoke @vivobr
  Scenario: A vivobr user can accept the contacts permissions in ios device
    Native permissions popups, will display the texts in device language
    Given user just installed the application
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "Vivo quiere acceder a tus contactos" text is displayed
      And the "popup.message" textfield with "Aceite esta permissaão para personalizar os contatos vinculados ao seu plano com a mesma imagem usada na lista de contatos do seu aparelho. Seus contatos não são salvos em nossos servidores." text is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-525537 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @smoke @vivobr @har
  Scenario: A vivobr user can cancel the contacts permissions in ios device
    Native permissions popups, will display the texts in device language
    Given user just installed the application
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "Vivo quiere acceder a tus contactos" text is displayed
      And clicks on the "popup.cancel" button
      And the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-68872 @android @automation.hard @jira.cv.12.2 @jira.link.parent_test_plan.QANOV-181726 @har
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @smoke @vivobr
  Scenario: A vivobr user can accept the initial permissions in android version 10
    internal_checkpoint="Native permissions popups, will display the texts in device language"
    Given the device version is "equal" to "10.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with "[LANG:launch_app.background_location.text]" text is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_ok]" text
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Vivo acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "PERMITIR SIEMPRE" text
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-68873 @android @automation.hard @jira.cv.12.2 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @smoke @vivobr @har
  Scenario: A vivobr user can accept the initial permissions in android version lower than 10
    internal_checkpoint="Native permissions popups, will display the texts in device language.
    Depending on the device the permission popups could be displayed in different order"
    This scenario is automated but with changes in the name we need to change to manual
    Given the device version is "lower" than "10.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the "¿Permitir a Vivo acceder a tus contactos?|¿Permitir a Vivo acceder a llamadas telefónicas?|¿Permitir a Vivo hacer y administrar llamadas de teléfono?" format is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the "¿Permitir a Vivo acceder a tus contactos?|¿Permitir a Vivo acceder a llamadas telefónicas?|¿Permitir a Vivo hacer y administrar llamadas de teléfono?" format is displayed
      And clicks on the "popup.accept" button
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.accept" button with "[LANG:launch_app.background_location.button_ok]" text
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir a Vivo acceder a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "PERMITIR" text
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke @har
  Scenario Outline: A <product> user, with Android version 13 or greater, can accept the initial permissions on android devices
    Native permissions popups, will display the texts in device language
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que <app_name> te envíe notificaciones?" text is displayed
      And clicks on the "popup.accept" button
     Then the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And fills the PIN placeholder
      And the "Basic Permissions" page is not displayed

    Examples:
          | product | cv     | app_name  | depends_on   | jira_id      |
          | blaude  | Future | Mein Blau | QANOV-287406 | QANOV-287412 |
          | o2de    | Future | Mein O2   | QANOV-287407 | QANOV-287413 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @smoke @har
  Scenario Outline: A <product> user can accept the initial permissions on iOS devices
    Native permissions popups, will display the texts in device language
    Given user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "<app_name> quiere enviarte notificaciones" text is displayed
      And clicks on the "popup.accept" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | app_name  | jira_id      |
          | blaude  | Future | Mein Blau | QANOV-230318 |
          | o2de    | Future | Mein O2   | QANOV-230319 |

  @jira.<jira_id> @<product> @android @jira.cv.12.2 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: The <product> app asks for permission when user go back using native back from Basic permission screen
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the native "back" button
     Then the "Basic Permissions" page is not displayed
      And the "Permissions Popup" popup is displayed

    Examples:
          | product | parent_test_plan | jira_id     |
          | moves   |                  | QANOV-68877 |
          | o2uk    |                  | QANOV-68878 |
          | vivobr  | QANOV-537945     | QANOV-68879 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: The <product> app asks for permission when user go back using native back from Basic permission screen
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the native "back" button
     Then the "Basic Permissions" page is not displayed
      And the "Permissions Popup" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | Future | QANOV-287414 |
          | o2de    | Future | QANOV-287415 |

  @jira.QANOV-68884 @android @jira.cv.12.2 @jira.link.detects.ANDROID-9930 @manual @mobile @o2uk @regression
  Scenario: A o2uk user kills the app in the middle of a permission request
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|llamadas).*" format is displayed
      And terminates the app
      And launches the app
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|llamadas).*" format is displayed

  @jira.<jira_id> @<product> @android @jira.cv.12.2 @jira.link.detects.ANDROID-9930
  @jira.link.parent_test_plan.<parent_test_plan> @manual @regression
  Scenario Outline: A <product> user kills the app in the middle of a permission request
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|llamadas).*" format is displayed
      And terminates the app
      And launches the app
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|llamadas).*" format is displayed

    Examples:
          | product | parent_test_plan | jira_id     |
          | moves   |                  | QANOV-68883 |
          | vivobr  | QANOV-537945     | QANOV-68885 |

  @jira.QANOV-525538 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression
  @vivobr
  Scenario: A vivobr user kills the app when cancel notification can see again the notification
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|llamadas).*" format is displayed
      And clicks on the "popup.cancel" button
      And terminates the app
      And launches the app
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|llamadas).*" format is displayed

  @jira.QANOV-525539 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression
  @vivobr
  Scenario: A vivobr user kills the app when cancel location notification can see again the location notification
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Background Location Popup" popup is displayed
      And clicks on the "popup.cancel" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And terminates the app
      And launches the app
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Background Location Popup" popup is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @regression
  Scenario Outline: A <product> user kills the app in the middle of a permission request
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*notificaciones.*" format is displayed
      And terminates the app
      And launches the app
      And fills the PIN placeholder
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*notificaciones.*" format is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | Future | QANOV-287416 |
          | o2de    | Future | QANOV-287417 |

  @jira.QANOV-68886 @android @jira.cv.12.2 @manual @mobile @moves @regression
  Scenario: A moves user denies, at least, one permission and still the app does not show a snackbar
    Given the device version is "greater" than "7.0"
      And the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "warning" element is not displayed

  @jira.<jira_id> @<product> @android @jira.cv.12.2 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A <product> user denies, at least, one permission and still the app does not show a snackbar
    Given the device version is "lower" than "11.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Background Location Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "warning.text" textfield is not displayed

    Examples:
          | product | parent_test_plan | jira_id     |
          | o2uk    |                  | QANOV-68887 |
          | vivobr  | QANOV-537945     | QANOV-68888 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A <product> user denies at least one initial permission and still the app does not show a warning
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed
      And the "warning.text" textfield is not displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-287406 | QANOV-287418 |
          | o2de    | Future | QANOV-287407 | QANOV-287419 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.13.0 @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @regression
  Scenario Outline: Initial permissions screen is not shown when user change location permission manually
    Given the device version is "greater" than "10.0"
      And user is logged in
     When user changes location permission to "Ask every time"
      And launches the app
     Then the "Basic Permissions" page is not displayed

    Examples:
          | product | parent_test_plan | jira_id      |
          | o2uk    |                  | QANOV-192231 |
          | vivobr  | QANOV-537945     | QANOV-184189 |

  @jira.<jira_id> @android @automation.hard @jira.cv.13.0 @manual @mobile @regression
  Scenario Outline: Initial permissions screen is shown when user selects location permission with "While using the app" option and cancel popup background permission
    Native permissions popups, will display the texts in device language.
    Given the device version is "greater" than "10.0"
      And the device version is "lower" than "13.0"
      And user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que <brand> acceda a tus contactos?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que <brand> haga y gestione llamadas?" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que <brand> acceda a la ubicación de este dispositivo?" text is displayed
      And clicks on the "popup.accept" button with "Solo si la aplicación está en uso" text
      And the "Background Location Popup" popup is displayed
      And the "popup.message" textfield with the "[LANG:launch_app.background_location.text]" format is displayed
      And clicks on the "popup.cancel" button with "<cancel>" text
      And terminates the app
      And launches the app
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Background Location Popup" popup is displayed

    @jira.link.parent_test_plan.QANOV-181726 @vivobr
    Examples:
          | brand | cancel   | jira_id      |
          | Vivo  | CANCELAR | QANOV-184192 |

    @o2uk
    Examples:
          | brand | cancel | jira_id      |
          | My O2 | CANCEL | QANOV-184193 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user, with Android version 13 or greater, can reject the initial permissions on android devices
    Native permissions popups, will display the texts in device language
    Given the device version is "equal_or_greater" than "13.0"
      And user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
      And the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que <app_name> te envíe notificaciones?" text is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | app_name  | depends_on   | jira_id      |
          | blaude  | Future | Mein Blau | QANOV-287406 | QANOV-287420 |
          | o2de    | Future | Mein O2   | QANOV-287407 | QANOV-287421 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can reject the initial permissions on iOS devices
    Native permissions popups, will display the texts in device language
    Given user just installed the application
      And the "Cookies Permissions" popup is displayed
     When clicks on the "accept_all" button
      And logs in the application
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "<app_name> quiere enviarte notificaciones" text is displayed
      And clicks on the "popup.cancel" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv     | app_name  | jira_id      |
          | blaude  | Future | Mein Blau | QANOV-254772 |
          | o2de    | Future | Mein O2   | QANOV-254773 |

  @jira.QANOV-437365 @ios @jira.cv.14.8 @manual @mobile @moves @regression
  Scenario: User with activity tracking permission access to the App for the first time: Popup to track the user's activity is displayed
    The activity tracking permission is located in: Settings > General > Privacy > Tracking
    Given user has granted "activity_tracking" permissions
      And user has never open the application
     When launches the app
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Permitir que Mi Movistar realice un seguimiento de tu actividad en los sitios web y en las apps de otras empresas?" text is displayed
      And the "popup.subtitle" textfield with "Tus datos se utilizarán para mostrarte anuncios personalizados" text is displayed
      And the "popup.cancel" button with "Pedir a la app que no rastree" text is displayed
      And the "popup.accept" button with "Permitir" text is displayed

  @jira.QANOV-437366 @ios @jira.cv.14.8 @manual @mobile @moves @regression
  Scenario: User with activity tracking permission deny the activity tracking for Movistar España: setting is shown unchecked in the Settings page
    The activity tracking permission is located in: Settings > General > Privacy > Tracking
    Given user has granted "activity_tracking" permissions
      And user has never open the application
     When launches the app
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Permissions Popup" popup is not displayed
      And the "Splash Screen" page is displayed
      And the tracking permission for the "Mi Movistar" app is in "deny" status

  @jira.QANOV-437367 @ios @jira.cv.14.8 @manual @mobile @moves @smoke @har
  Scenario: User with activity tracking permission allow the activity tracking for Movistar España: setting is shown checked in the Settings page
    The activity tracking permission is located in: Settings > General > Privacy > Tracking
    Given user has granted "activity_tracking" permissions
      And user has never open the application
     When launches the app
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Permissions Popup" popup is not displayed
      And the "Splash Screen" page is displayed
      And the tracking permission for the "Mi Movistar" app is in "allow" status

  @jira.QANOV-437368 @ios @jira.cv.14.8 @manual @mobile @moves @regression
  Scenario: User without activity tracking permission access to the App for the first time: Popup to track the user's activity is not displayed
    The activity tracking permission is located in: Settings > General > Privacy > Tracking
    Given user does not have granted "activity_tracking" permissions
      And user has never open the application
     When launches the app
     Then the "Permissions Popup" popup is not displayed
      And the "Splash Screen" page is displayed

  @jira.QANOV-453591 @android @jira.cv.Future @manual @mobile @o2es @smoke @har
  Scenario: An o2es android user is informed about which features require initial permissions
    Given user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is displayed
      And the "title" textfield with "[LANG:launch_app.basic_permission.title]" text is displayed
      And the "description" textfield with "[LANG:launch_app.basic_permission.description]" text is displayed
      And scrolls down
      And the element in "0" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.contacts_disclaimer_description]" text
      And the element in "1" position of the "permissions" list has the "icon" field
      And any element in the "permissions" list has the "permission_title" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_title]" text
      And any element in the "permissions" list has the "permission_description" textfield with the "[LANG:launch_app.basic_permission.notifications_disclaimer_description]" text
      And the "button" button with "[LANG:launch_app.basic_permission.button]" text is displayed
      And the "link" link with "[LANG:launch_app.basic_permission.link]" text is displayed

  @jira.QANOV-453592 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es android user can access to extra information about permissions
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "link" link
     Then the "Detail Permissions" page is displayed
      And the "[LANG:launch_app.detail_permission.header]" header is displayed
      And the "title" textfield with "[LANG:launch_app.detail_permission.top_subtitle]" text is displayed
      And the "contacts_title" textfield with "[LANG:launch_app.detail_permission.contacts_detail_title]" text is displayed
      And the "contacts_body" textfield with "[LANG:launch_app.detail_permission.contacts_detail_description]" text is displayed
      And the "notifications_title" textfield with "[LANG:launch_app.detail_permission.notifications_detail_title]" text is displayed
      And the "notifications_body" textfield with "[LANG:launch_app.detail_permission.notifications_detail_description]" text is displayed
      And the "final_text" textfield with "[LANG:launch_app.detail_permission.final_text]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Basic Permissions" page is displayed

  @jira.QANOV-453661 @android @jira.cv.Future @manual @mobile @o2es @smoke @har
  Scenario: An o2es android user can close the Basic Permissions screen to display the permissions popup
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Basic Permissions" page is not displayed
      And the "Permissions Popup" popup is displayed

  @jira.QANOV-453593 @android @jira.cv.Future @manual @mobile @o2es @sanity @har
  Scenario: An o2es android user can accept the initial permissions
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And the "popup.title" textfield that contains the "contactos" text is displayed
      And clicks on the "popup.accept" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield that contains the "notificaciones" text is displayed
      And clicks on the "popup.accept" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-453594 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es android user can reject the initial permissions
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
     Then the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
      And the "Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
      And the "[CONF:landing_tab]" page is displayed
      And terminates the app
      And launches the app
      And the "Basic Permissions" page is not displayed

  @jira.QANOV-453595 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A o2es android user kills the app in the middle of a permission request: Permission popup is displayed again
    Given user just installed the application
      And logs in the application
      And the "Basic Permissions" page is displayed
     When clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|notificaciones).*" format is displayed
      And terminates the app
      And launches the app
     Then the "Basic Permissions" page is displayed
      And clicks on the "button" button
      And the "Permissions Popup" popup is displayed
      And the "popup.title" textfield with the ".*(contactos|notificaciones).*" format is displayed

  @jira.QANOV-453596 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @smoke @har
  Scenario: An o2es ios user can accept the permissions when log in the app after installing it
    Given user just installed the application
      And logs in the application
     When accepts the native contacts permissions
      And accepts the native notifications permissions
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-453597 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es ios user can reject the permissions when log in the app after installing it
    Given user just installed the application
      And logs in the application
      And rejects the native contacts permissions
      And rejects the native notifications permissions
     Then the "[CONF:landing_tab]" page is displayed

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.24.0 @manual @mobile @sanity @har
  Scenario Outline: An android <product> user can login in the app and no permission is requested
    Given user just installed the application
     When logs in the application
     Then the "Basic Permissions" page is not displayed
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-545543 |
          | o2de    | QANOV-545544 |

  @jira.<jira_id> @<product> @automation.hard @ios @jira.cv.24.0 @manual @mobile @sanity @har
  Scenario Outline: An ios <product> user can login in the app and no permission is requested
    Given user just installed the application
     When logs in the application
     Then the "Permissions Popup" popup is not displayed
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-545546 |
          | o2de    | QANOV-545547 |

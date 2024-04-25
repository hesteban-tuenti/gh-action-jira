# -*- coding: utf-8 -*-
@jira.QANOV-597105 @not_hardening
Feature: In-app Validation


  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user can see a warning in a "<status>" in-app when the dynamic content is not available due to be in "<dyn_content_status>" status
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "<dyn_content_status>" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
     Then the element in "[CONTEXT:in_app_message_index]" position in the "in_app_messages_list" list has the "<warning>" field displayed

    Examples:
          | product | status      | dyn_content_status | warning             | jira_id      |
          | vivobr  | unpublished | paused             | yellow_warning_icon | QANOV-597107 |
          | vivobr  | published   | deleted            | red_warning_icon    | QANOV-597108 |
          | moves   | paused      | paused             | yellow_warning_icon | QANOV-597109 |
          | moves   | published   | deleted            | red_warning_icon    | QANOV-597110 |
          | o2uk    | unpublished | paused             | yellow_warning_icon | QANOV-597111 |
          | o2uk    | published   | paused             | red_warning_icon    | QANOV-597112 |
          | blaude  | paused      | paused             | yellow_warning_icon | QANOV-597113 |
          | blaude  | published   | deleted            | red_warning_icon    | QANOV-597114 |
          | o2de    | unpublished | paused             | yellow_warning_icon | QANOV-597116 |
          | o2de    | published   | deleted            | red_warning_icon    | QANOV-600353 |
          | o2es    | paused      | paused             | yellow_warning_icon | QANOV-597117 |
          | o2es    | published   | paused             | red_warning_icon    | QANOV-597118 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user who edits an "<status>" in-app when the dynamic content has been deleted will see the webview empty and a warning message
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "deleted" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "name" field with "<warning>" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "edit" button
      And the "In App Message Overview" page is loaded
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
     Then the "webview_select" inputtext is empty
      And the "red_warning_icon" icon is displayed
      And the "warning_textfield" textfield that contains the "has been removed" text is displayed

    Examples:
          | product | status      | warning             | jira_id      |
          | vivobr  | unpublished | yellow_warning_icon | QANOV-597119 |
          | moves   | paused      | yellow_warning_icon | QANOV-597120 |
          | o2uk    | published   | red_warning_icon    | QANOV-597122 |
          | blaude  | paused      | yellow_warning_icon | QANOV-597123 |
          | o2de    | unpublished | yellow_warning_icon | QANOV-597124 |
          | o2es    | published   | red_warning_icon    | QANOV-597125 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user can see a warning in a "<status>" in-app when the dynamic content has been paused
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "paused" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
     Then the element in "[CONTEXT:in_app_message_index]" position in the "in_app_messages_list" list has the "<warning>" field displayed

    Examples:
          | product | status      | warning             | jira_id      |
          | vivobr  | unpublished | yellow_warning_icon | QANOV-597126 |
          | vivobr  | publihed    | red_warning_icon    | QANOV-597127 |
          | moves   | paused      | yellow_warning_icon | QANOV-597128 |
          | moves   | published   | red_warning_icon    | QANOV-597129 |
          | o2uk    | unpublished | yellow_warning_icon | QANOV-597131 |
          | o2uk    | published   | red_warning_icon    | QANOV-597132 |
          | blaude  | paused      | yellow_warning_icon | QANOV-597133 |
          | blaude  | published   | red_warning_icon    | QANOV-597134 |
          | o2de    | unpublished | yellow_warning_icon | QANOV-597135 |
          | o2es    | paused      | yellow_warning_icon | QANOV-597136 |
          | o2es    | published   | red_warning_icon    | QANOV-597137 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user who edits an "<status>" in-app when the dynamic content has been paused will see a validation message
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "paused" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "name" field with "<warning>" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "edit" button
      And the "In App Message Overview" page is loaded
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
     Then the "webview_select" inputtext is not empty
      And the "warning_textfield" textfield that contains the "has been paused" text is displayed
      And the "warning_textfield" element is under "webview_select" element

    Examples:
          | product | status      | warning             | jira_id      |
          | vivobr  | unpublished | yellow_warning_icon | QANOV-597139 |
          | moves   | paused      | yellow_warning_icon | QANOV-597140 |
          | o2uk    | published   | red_warning_icon    | QANOV-597141 |
          | blaude  | paused      | yellow_warning_icon | QANOV-597142 |
          | o2de    | unpublished | yellow_warning_icon | QANOV-597143 |
          | o2es    | published   | red_warning_icon    | QANOV-597144 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user who edits an "<status>" in-app when the dynamic content has been paused and save it without changing the webview will see a a warning popup
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "paused" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "name" field with "yellow_warning_icon" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "edit" button
      And the "In App Message Overview" page is loaded
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I click on the "save" button
     Then the "edit_in-app_popup" element is displayed
      And the text of the element "popup_title" is equal to "This In-App needs edition"
      And the text of the element "popup_text" is equal to "To save this In-App message, unpause the associated webview as it is currently inactive."
      And the text of the element "ok_button" is equal to "Ok"

    Examples:
          | product | status      | jira_id      |
          | vivobr  | unpublished | QANOV-600476 |
          | moves   | paused      | QANOV-600477 |
          | o2uk    | unpublished | QANOV-600478 |
          | blaude  | paused      | QANOV-600479 |
          | o2de    | unpublished | QANOV-600480 |
          | o2es    | paused      | QANOV-600481 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user who edits an "<status>" in-app when the dynamic content has been deleted and publish it will see a warning popup
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "deleted" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "name" field with "yellow_warning_icon" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "publish" button
     Then the "edit_in-app_popup" element is displayed
      And the text of the element "popup_title" is equal to "This In-App needs edition"
      And the text of the element "popup_text" is equal to "To publish this In-App, update the associated webview as the previous one was removed."
      And the text of the element "edit_button" is equal to "Edit In-App"
      And the text of the element "cancel_button" is equal to "Cancel"

    Examples:
          | product | status      | jira_id      |
          | vivobr  | paused      | QANOV-597145 |
          | moves   | unpublished | QANOV-597146 |
          | o2uk    | unpublished | QANOV-597147 |
          | blaude  | paused      | QANOV-597148 |
          | o2de    | unpublished | QANOV-597149 |
          | o2es    | paused      | QANOV-597151 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @regression @web
  Scenario Outline: A user who edits an "<status>" in-app when the dynamic content has been paused and publish it will see a warning popup
    Given user has ">=1" In-App Messages of "webview" associated to a dynamic content and with "paused" status
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "name" field with "yellow_warning_icon" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "publish" button
     Then the "edit_in-app_popup" element is displayed
      And the text of the element "popup_title" is equal to "This In-App needs edition"
      And the text of the element "popup_text" is equal to "To publish this In-App, unpause the associated webview as it is currently inactive."
      And the text of the element "edit_button" is equal to "Edit In-App"
      And the text of the element "cancel_button" is equal to "Cancel"

    Examples:
          | product | status      | jira_id      |
          | vivobr  | unpublished | QANOV-597152 |
          | moves   | paused      | QANOV-597153 |
          | o2uk    | unpublished | QANOV-597154 |
          | blaude  | paused      | QANOV-597155 |
          | o2de    | unpublished | QANOV-597156 |
          | o2es    | paused      | QANOV-597157 |

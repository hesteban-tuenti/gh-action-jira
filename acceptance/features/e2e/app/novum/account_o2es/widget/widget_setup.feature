# -*- coding: utf-8 -*-
@jira.QANOV-476347
Feature: Widget Setup

  Actions Before the Feature:
    Given user has a "mobile" product


  @jira.QANOV-476348 @android @automation.hard @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User can select to install small o big widget on Android devices
    Size of widget depend of screen resolution, can be 3x3 and 5x3, 2x2 and 4x2 or 2x3 and 4x3
    Given user is in the "Native Widget Configuration" page
     When searches "Mi O2" app
     Then the "widget_list" list is displayed
      And each element in the "widget_list" list has the "image" field
      And each element in the "widget_list" list has the "name" textfield with "Mi O2" text
      And each element in the "widget_list" list has the "size" field
      And the element in "0" position in the "widget_list" list has the "size" field with the "(3x3|3x2|2x2|2x3)" format
      And the element in "1" position in the "widget_list" list has the "size" field with the "(5x3|5x2|4x2|4x3)" format

  @jira.QANOV-476349 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User can select to install little o big widget on iOS devices
    Given user is in the "Native Widget Configuration" page
     When searches "Mi O2" app
     Then the "widget_carousel" carousel is displayed
      And first card of "widget_carousel" carousel has the "title" textfield with "[LANG:widget.widget_small_title]" text is displayed
      And first card of "widget_carousel" carousel has the "description" textfield with "[LANG:widget.widget_small_description]" text is displayed
      And second card of "widget_carousel" carousel has the "title" textfield with "[LANG:widget.widget_big_title]" text is displayed
      And second card of "widget_carousel" carousel has the "description" textfield with "[LANG:widget.widget_big_description]" text is displayed

  @jira.QANOV-476350 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User not logged in the app can see an informative message in the Account widget
    Given user is logged out
      And install "any" widget
     When navigates to "Account" widget
     Then the "widget_logged_out_error_text" textfield with "[LANG:widget.widget_logged_out_error_text]" text is displayed
      And the "widget_logged_out_error_link" link with "[LANG:widget.widget_logged_out_error_link]" text is displayed
      And the "o2es_icon" icon is displayed

  @jira.QANOV-476351 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User not logged in the app can access to the splash screen from the Account widget
    Given user is logged out
      And the "any" widget is installed in the device
     When navigates to "Account" widget
      And clicks on the "widget_logged_out_error_link" link
     Then the "Splash Screen" page is displayed

  @jira.QANOV-476352 @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User not logged in the app can not configure the widget on iOS devices
    Given user is logged out
      And the "any" widget is installed in the device
     When navigates to "Account" widget
      And long clicks over the widget
      And clicks on the "Edit widget" link
      And clicks on the element with "link" field with "Línea" value of the "option_list" list
     Then the "No Login" popup is displayed
      And the "popup.message" textfield with "[LANG:widget.widget_no_login_popup]" text is displayed
      And the "popup.accept" button with "OK" text is displayed

  @jira.QANOV-476353 @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User logged with more than one mobile line in the app who just installed the Account widget can see a configuration message on iOS devices
    Given user has "several" mobile lines
      And user is logged in
     When installs the "any" widget natively
     Then the "Account" widget is installed
      And the "configure_title" textfield with "[LANG:widget.widget_configure_text]" text is displayed

  @jira.QANOV-476354 @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User logged with one mobile line can install the Account widget on iOS devices
    If there is only one line, by default the 2x2_data widget is shown
    Given user has "1" mobile lines
      And user is logged in
     When installs the "small" widget natively
     Then the "2x2_data" widget is installed
      And the data of the mobile line is displayed on the small widget

  @jira.QANOV-476355 @android @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with more than one mobile line will see the "line selection" after install the widget on Android devices
    In case of a holder that has two different contracts, and that both contracts have at least one mobile line, then the
    information shown on the disambiguation screen should be a list of all mobile lines of that holder, independently of
    which contract they belong to.
    Given user has "several" mobile lines
     When installs the "any" widget natively
     Then the "Mobile Line Selection" page is displayed
      And the "[LANG:widget.widget_selection_line_header]" header is displayed
      And the "line_selection_text" textfield with "[LANG:widget.widget_selection_line_text]" text is displayed
      And the "mobile_lines_list" list is displayed
      And each element in the "mobile_lines_list" list has the "number" field
      And each element in the "mobile_lines_list" list has the "product_type" textfield with "Línea móvil" text
      And each element in the "mobile_lines_list" list has the "contract_type" field
      And the "mobile_lines_list" list contains all the mobile lines of the user

  @jira.QANOV-476356 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User with more than one line can continue the Widget configuration on iOS devices
    Note that the "Tipo" option just will be displayed if the user selects a line first
    Given user has "several" mobile lines
     When user has a "small" widget pending to configure
      And clicks on the widget
     Then the "Native Configuration widget" page is displayed
      And the "o2es_icon" icon is displayed
      And the "title" textfield with "[LANG:widget.widget_small_title]" text is displayed
      And the "description" textfield with "Tu consumo siempre a mano." text is displayed
      And the "option_list" list is displayed
      And each element in the "option_list" list has the "name" field
      And each element in the "option_list" list has the "link" field
      And the element in "0" position in the "option_list" list has the "name" textfield with the "Línea" text
      And the element in "1" position in the "option_list" list has the "name" textfield with the "Tipo" text

  @jira.QANOV-476357 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User with more than one line can configure the mobile line on iOS devices
    In case of a holder that has two different contracts, and that both contracts have at least one mobile line, then the
    information shown on the disambiguation screen should be a list of all mobile lines of that holder, independently of
    which contract they belong to.
    Given user has "several" mobile lines
      And user has "any" widget pending to configure
     When clicks on the widget
      And the "Native Configuration widget" page is displayed
      And clicks on the element with "link" field with "Línea" value of the "option_list" list
     Then the "Native Mobile Line Selection" page is displayed
      And the "[LANG:widget.widget_selection_line_header_ios]" header is displayed
      And the "cancel_button" button is displayed
      And the "mobile_lines_list" list is displayed
      And each element in the "mobile_lines_list" list has the "number" field
      And each element in the "mobile_lines_list" list has the "product_type" textfield with "Línea móvil" text
      And each element in the "mobile_lines_list" list has the "contract_type" field
      And the "mobile_lines_list" list contains all the mobile lines of the user

  @jira.QANOV-476358 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User cancels to select a line in the Account widget: Widget is pending to configure on iOS devices
    Given user has "several" mobile lines
      And user has "any" widget pending to configure
      And user is in the "Native Mobile Line Selection" page
     When clicks on the "cancel_button" button
     Then the "Native Configuration widget" page is displayed

  @jira.QANOV-476359 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User cancels to select a line in the Account widget: Widget is not installed on Android devices
    Given user has "several" mobile lines
     When installs the "any" widget natively
      And the "Mobile Line Selection" page is displayed
      And clicks on the "back_button" button
     Then the "Account" widget is not installed

  @jira.<jira_id> @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User with more than one line and without connectivity cannot configure the widget on iOS devices
    Given user has "several" mobile lines
      And user has "any" widget pending to configure
      And user turns on the Airplane mode
      And user is in the "Native Configuration Widget" page
     When clicks on the element with "link" field with "Línea" value of the "option_list" list
     Then the "No Connectivity" popup is displayed
      And the "popup.message" textfield with "[LANG:widget.widget_check_connectivity_popup]" text is displayed
      And the "popup.accept" button with "OK" text is displayed

    Examples:
          | option | jira_id      |
          | Línea  | QANOV-476360 |
          | Tipo   | QANOV-476361 |

  @jira.<jira_id> @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User with more than one line and if an error happens cannot configure the widget on iOS devices
    Given user has "several" mobile lines
      And user has "any" widget pending to configure
      And user is in the "Native Configuration Widget" page
     When clicks on the element with "link" field with "<option>" value of the "option_list" list
      And there is an error saving the selected option
     Then the "Error" popup is displayed
      And the "popup.message" textfield with "[LANG:widget.widget_error_popup]" text is displayed
      And the "popup.accept" button with "OK" text is displayed

    Examples:
          | option | jira_id      |
          | Línea  | QANOV-476362 |
          | Tipo   | QANOV-476363 |

  @jira.QANOV-476364 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User with more than one line and without connectivity cannot install the widget on Android devices
    Given user has "several" mobile lines
      And user turns on the Airplane mode
     When installs the "any" widget natively
     Then the "Mobile Line Selection" page is displayed
      And the "mobile_lines_list" list is not displayed
      And the "line_selection_empty_case_error_1_text" textfield with "[LANG:widget.widget_selection_line_error_text]" text is displayed
      And the "line_selection_empty_case_error_2_text" textfield with "[LANG:widget.widget_check_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:widget.widget_retry_button]" text is displayed
      And the "cancel_button" button with "[LANG:widget.widget_cancel_button]" text is displayed
      And clicks on the "cancel_button" button
      And the "Account" widget is not installed

  @jira.QANOV-476365 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User with more than one line cannot install the widget if an error happens when saving the selected line on Android devices
    Given user has "several" mobile lines
     When installs the "any" widget natively
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list
      And there is an error saving the selected line in the widget
     Then the "warning" warning is displayed
      And the "warning.text" textfield with "[LANG:widget.widget_mobile_line_selection_error_text]" text is displayed

  @jira.QANOV-476366 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: If the user doesn't have any mobile line then the widget cannot be installed on Android devices
    Given user has "0" mobile lines
     When installs the "any" widget natively
     Then the "Mobile Line Selection" page is displayed
      And the "mobile_lines_list" list is not displayed
      And the "widget_no_mobile_lines_title" textfield with "[LANG:widget.widget_no_active_mobile_line_selection_text]" text is displayed
      And the "contract_button" button with "[LANG:widget.widget_no_active_mobile_line_link]" text is displayed
      And the "cancel_button" button with "[LANG:widget.widget_cancel_button]" text is displayed
      And clicks on the "cancel_button" button
      And the "Account" widget is not installed

  @jira.QANOV-476367 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User cann access an OB webview to contract lines from the Widget Mobile Selection screen on Android devices
    Given user has "0" mobile lines
     When installs the "any" widget natively
     Then the "Mobile Line Selection" page is displayed
      And clicks on the "contract_button" button
     Then the browser webview is displayed

  @jira.QANOV-476368 @android @automation.hard @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with more than one line can install the big widget: the widget will shown the info about the selected line
    Given user has "several" mobile lines
     When installs the "big" widget natively
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list
     Then the data and minutes of the mobile line is displayed on the big widget

  @jira.QANOV-476369 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with more than one mobile line will see the "Consumption selection" after select the mobile line on iOS devices
    Given user has "several" mobile lines
      And user has "any" widget pending to configure
     When clicks on the widget
      And the "Native Configuration widget" page is displayed
      And clicks on the element with "link" field with "Tipo" value of the "option_list" list
     Then the "Native Consumption Selection" page is displayed
      And the "[LANG:widget.widget_consumption_title]" header is displayed
      And the "cancel_button" button is displayed
      And the "consumption_list" list is displayed
      And each element in the "consumption_list" list has the "consumption_type" field
      And the "consumption_list" list contains all consumption types of the mobile line
      And clicks on the "cancel_button" button
      And the "Native Configuration widget" page is displayed

  @jira.QANOV-476370 @android @automation.hard @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with more than one mobile line will see the "Consumption selection" after select the mobile line on Android devices
    Given user has "several" mobile lines
     When installs the "small" widget natively
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list
     Then the "Consumption Selection" page is displayed
      And the "[LANG:widget.widget_selection_line_header]" header is displayed
      And the "title" textfield with "[LANG:widget.widget_consumption_title]" text is displayed
      And the "description" textfield with "[LANG:widget.widget_consumption_description]" text is displayed
      And the "consumption_list" list is displayed
      And each element in the "consumption_list" list has the "consumption_type" field
      And the "consumption_list" list contains all consumption types of the mobile line
      And clicks on the "back" button
      And the "Mobile Line Selection" page is displayed

  @jira.QANOV-476371 @android @automation.hard @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with one mobile line will see the "Consumption selection" directly on Android devices
    Given user has "1" mobile lines
     When installs the "small" widget natively
     Then the "Consumption Selection" page is displayed
      And the "[LANG:widget.widget_selection_line_header]" header is displayed
      And the "title" textfield with "[LANG:widget.widget_consumption_title]" text is displayed
      And the "description" textfield with "[LANG:widget.widget_consumption_description]" text is displayed
      And the "consumption_list" list is displayed
      And each element in the "consumption_list" list has the "consumption_type" field
      And the "consumption_list" list contains all consumption types of the mobile line
      And clicks on the "back" button
      And the "native desktop" page is displayed

  @jira.<jira_id> @<ber> @android @automation.hard @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario Outline: User with more than one mobile can install "2x2_<consumption_type>" on Android devices
    Given user has "several" mobile lines
     When installs the "small" widget natively
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list
      And the "Consumption Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list that contains the "<consumption_type>" text
     Then the "<consumption_type>" information about the mobile line is displayed on the small widget

    Examples:
          | consumption_type | ber | jira_id      |
          | data             | ber | QANOV-476372 |
          | minutes          | ber | QANOV-476373 |
          | charges          |     | QANOV-476374 |

  @jira.<jira_id> @<ber> @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario Outline: User with more than one mobile can install "2x2_<consumption_type>" on iOS devices
    Given user has "several" mobile lines
     When installs the "small" widget natively
      And clicks on the widget
      And selects the mobile line
      And selects the "<consumption_type>" consumption type
     Then the "<consumption_type>" information about the mobile line is displayed on the small widget

    Examples:
          | consumption_type | ber | jira_id      |
          | data             | ber | QANOV-476375 |
          | minutes          | ber | QANOV-476376 |
          | charges          |     | QANOV-476377 |

  @jira.QANOV-476378 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can access to the widget configuration from widget on iOS devices
    Given user has "any" widget activated
     When navigates to "Account" widget
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration Widget" page is displayed

  @jira.<jira_id> @android @automation.hard @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User with <mobile_lines_number> can access to the widget configuration from widget on Android devices
    Given user has "<mobile_lines_number>" mobile lines
      And user has "any" widget activated
     When navigates to "Account" widget
      And clicks on the "phone_number" link
     Then the "Native Configuration widget" page is displayed

    Examples:
          | mobile_lines_number | destination_page      | jira_id      |
          | several             | Mobile Line Selection | QANOV-476379 |
          | 1                   | Consumption Selection | QANOV-476380 |

  @jira.QANOV-476381 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User can install several widgets at the same time
    The user can install 4 different widgets: 2x2_data, 2x2_minutes, 2x2_extra_charges, 4x2_data_minutes
    Given user has installed the "2x2_data" widget
     When installs the "2x2_minutes" widget natively
     Then the Account widget is installed in the device with "o2es_icon" icon

  @jira.QANOV-476382 @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User with iOS version 16 or greater can install the Account widget on the Lock screen
    Given the device version is "equal_or_greater" than "16"
     When installs the "any" widget natively on the "Lock" screen
     Then the "any" widget is installed in the "Lock" screen

  @jira.QANOV-476383 @android @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with one mobile line and one consumption will see the corresponding widget automatically on Android devices
    Given user has "1" mobile lines
      And user has "1" consumption types
     When installs the "any" widget natively
     Then the "Consumption Selection" page is displayed
      And the "consumption_list" list contains only one consumption type
      And the "Consumption Selection" page is closed automatically
      And the "Account" widget is installed
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-476384 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User has to configure widget when logs in with different user with one line and only one consumption type on Android devices
    Given user is logged out
      And the "any" widget is installed in the device
      And user has "1" mobile lines
      And user has "1" consumption types
      And logs in the application
     When navigates to "Account" widget
      And clicks on the "configure_button" button
     Then the "Consumption Selection" page is displayed
      And the "consumption_list" list contains only one consumption type
      And the "Consumption Selection" page is closed automatically
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-476385 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User with more than one mobile line and one consumption will see the corresponding widget automatically on Android devices
    Given user has "several" mobile lines
      And user has "1" consumption types
     When installs the "any" widget natively
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list
     Then the "Consumption Selection" page is displayed
      And the "Consumption Selection" page is closed automatically
      And the "Account" widget is installed
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-476386 @android @jira.cv.Future @mobile @o2es @regression
  Scenario: User has to configure widget when logs in with different user with several lines and only one consumption type on Android devices
    Given user is logged out
      And the "any" widget is installed in the device
      And user has "several" mobile lines
      And user has "1" consumption types
      And logs in the application
     When navigates to "Account" widget
      And clicks on the "configure_button" button
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_lines_list" list
     Then the "Consumption Selection" page is displayed
      And the "consumption_list" list contains only one consumption type
      And the "Consumption Selection" page is closed automatically
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-506441 @jira.cv.Future @ios @manual @mobile @o2es @smoke
  Scenario: User with one mobile line and one consumption will see the corresponding widget automatically on iOS devices
    Given user has "1" mobile lines
      And user has "1" consumption types
     When installs the "any" widget natively
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration widget" page is displayed
      And the element with "link" field with "Línea" value of the "option_list" list is displayed
      And the element with "link" field with "Tipo" value of the "option_list" list is displayed
      And the mobile line is automatically selected
      And the consumption is automatically selected
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-506442 @jira.cv.Future @ios @manual @mobile @o2es @regression
  Scenario: User has to configure widget when logs in with different user with one line and only one consumption type on iOS devices
    Given user is logged out
      And the "any" widget is installed in the device
      And user has "1" mobile lines
      And user has "1" consumption types
      And logs in the application
     When navigates to "Account" widget
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration widget" page is displayed
      And the element with "link" field with "Línea" value of the "option_list" list is displayed
      And the element with "link" field with "Tipo" value of the "option_list" list is displayed
      And the mobile line is automatically selected
      And the consumption is automatically selected
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-506443 @jira.cv.Future @ios @manual @mobile @o2es @regression
  Scenario: User with more than one mobile line and one consumption will see the corresponding widget automatically on iOS devices
    Given user has "several" mobile lines
      And user has "1" consumption types
     When installs the "any" widget natively
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration widget" page is displayed
      And clicks on the element with "link" field with "Línea" value of the "option_list" list
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_line_list" list
      And the element with "link" field with "Tipo" value of the "option_list" list is displayed
      And the consumption is automatically selected
      And the consumption information about the mobile line is displayed on the small widget

  @jira.QANOV-506444 @jira.cv.Future @ios @manual @mobile @o2es @regression
  Scenario: User has to configure widget when logs in with different user with several lines and only one consumption type on iOS devices
    Given user is logged out
      And the "any" widget is installed in the device
      And user has "several" mobile lines
      And user has "1" consumption types
      And logs in the application
     When navigates to "Account" widget
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration widget" page is displayed
      And clicks on the element with "link" field with "Línea" value of the "option_list" list
      And the "Mobile Line Selection" page is displayed
      And clicks on any element in the "mobile_line_list" list
      And the element with "link" field with "Tipo" value of the "option_list" list is displayed
      And the consumption is automatically selected
      And the consumption information about the mobile line is displayed on the small widget

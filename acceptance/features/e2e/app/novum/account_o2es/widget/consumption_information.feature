# -*- coding: utf-8 -*-
@jira.QANOV-476315
Feature: Consumption information

  Actions Before the Feature:
    Given user has a "mobile" product


  @jira.QANOV-476316 @android @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can see an error message in the Account widget if a general error happens
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And there is a general error in the widget
     Then the "widget_general_error_icon" icon is displayed
      And the "widget_general_error_text" textfield with "[LANG:widget.widget_general_error_text]" text is displayed
      And the "widget_general_error_subtext" textfield with "[LANG:widget.widget_general_error_subtext]" text is displayed

  @jira.QANOV-476317 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Widget with data persisted from before receives an error when updating the info: old persisted data will be shown on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And clicks on the "refresh" button
     Then the information of the Account widget is updated with the persisted data
      And the "widget_update_time" textfield with the last update time is displayed
      And user turns off the Airplane mode

  @jira.QANOV-476318 @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Widget with data persisted from before receives an error when updating the info: old persisted data will be shown on iOS devices
    widget info will be updated when user open her Today Screen
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And widget info is refreshed
     Then the information of the Account widget is updated with the persisted data
      And the "widget_update_time" textfield with the last update time is displayed
      And user turns off the Airplane mode

  @jira.QANOV-476320 @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Widget without data persisted from before receives an error when updating the info: error message will be shown on iOS devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And widget info is refreshed
     Then the "widget_loading_error_icon" icon is displayed
      And the "widget_loading_error_text" textfield with "[LANG:widget.widget_loading_error_text]" text is displayed
      And user turns off the Airplane mode

  @jira.QANOV-476321 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Widget without data persisted can see an error in the Account widget on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And user turns off the Airplane mode
     Then the "widget_loading_error_icon" icon is displayed
      And the "widget_loading_error_text" textfield with "[LANG:widget.widget_loading_error_text]" text is displayed
     Then the "widget_loading_error_icon" icon is displayed
      And the "widget_loading_error_link" textfield with "[LANG:widget.widget_loading_error_link]" text is displayed

  @jira.QANOV-476322 @android @jira.cv.Future @jira.link.depends_on.QANOV-476321 @manual @mobile @o2es @regression
  Scenario: Widget without data persisted can retry to load the content in the Account widget on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And user turns off the Airplane mode
      And clicks on the "widget_loading_error_link" link
     Then widget content is loaded properly

  @jira.QANOV-476323 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User with several mobile lines, who cancel a mobile line have to configure the widget for another line
    Can be tested installing the widget for a line, logging out from that account and logging in with other account
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
     Then the "widget_cancel_line_text" textfield with "[LANG:widget.widget_cancel_line_text]" text is displayed
      And the "widget_cancel_line_subtext" textfield with "[LANG:widget.widget_cancel_line_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_configure_button]" text is displayed

  @jira.QANOV-476324 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User with several mobile lines, who cancel a mobile line can configure the widget for another line
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
      And clicks on the "widget_configure_button" button
     Then the "Mobile Line Selection" page is displayed

  @jira.QANOV-476325 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User with one line, cancels the mobile line contract a contract message is shown in widget
    Given user has "1" mobile lines
      And user has the "any" widget activated
     When cancels a mobile line
      And navigates to "Account" widget
     Then the "widget_cancel_line_text" textfield with "[LANG:widget.widget_cancel_line_text]" text is displayed
      And the "widget_cancel_line_subtext" textfield with "[LANG:widget.widget_cancel_line_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_cancel_button]" text is displayed

  @jira.QANOV-476326 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User who changes the rate and the types of consumption associated has to update the widget
    Given user has the "any" widget activated
     When changes the tariff
      And navigates to "Account" widget
     Then the "widget_change_tariff_text" textfield with "[LANG:widget.widget_change_tariff_text]" text is displayed
      And the "widget_change_tariff_subtext" textfield with "[LANG:widget.widget_change_tariff_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_change_tariff_button]" text is displayed

  @jira.QANOV-476327 @android @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User with more than one line, who changes the rate and the types of consumption associated can update the widget
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When changes the tariff
      And navigates to "Account" widget
      And clicks on the "widget_configure_button" button
     Then the "Mobile Line Selection" page is displayed

  @jira.QANOV-476328 @android @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User will see a loading icon in the Account widget while updating the info in Android devices
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And clicks on the "refresh_button" button
     Then the "loading_icon" icon is displayed

  @jira.QANOV-476329 @ios @jira.cv.Future @mobile @no_automatable @o2es @regression
  Scenario: User will see a loading icon in the Account widget while updating the info in iOS devices
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And the user information is being updated
     Then the "skeleton" element is on display
      And the widget content is not loaded

  @jira.QANOV-476330 @android @automation_hard @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User can identify which line is displayed on the widget
    If the MSISDN is cut in the small widget, we will show ellipses at the beginning: ...04500430
    Given user has the "any" widget activated
     When navigates to "Account" widget
     Then the phone number of the mobile line for which the information was shown is displayed

  @jira.QANOV-476331 @android @automation.hard @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User can see the limited data usage in the Account Widget
    Given user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_label" textfield with "[LANG:widget.widget_data_label]" text is displayed
      And the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "last_update" textfield with the "A las \d\d:\d\d" format is displayed

  @jira.QANOV-476332 @android @automation_hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User who has not made any consumption of the limited data allowance can see the allowance bar in gray in the Account widget
    Given user has consumed "0%" of the "2x2_data" allowance in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_bar" allowance bar is displayed in "gray" color

  @jira.QANOV-476333 @android @automation_hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Postpay user who has consumed less than 100% of the limited data allowance can see the allowance bar in blue in the Account widget
    Given user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_bar" allowance bar is displayed in "blue" color

  @jira.QANOV-476334 @android @automation_hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User who has consumed 100% of the limited data allowance can see the allowance bar in red in the Account widget
    Given user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_bar" allowance bar is displayed in "red" color

  @jira.QANOV-476335 @android @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User can see the unlimited minutes usage in the Account Widget
    The date when the billing cycle ends will be displayed only when i'ts available via API:
    - If the end date is <1 day we will say today
    - If the end date is >1 day we will add the exact date
    End date will not shown, if this is not returned by the API
    Given user has the "2x2_minutes" widget activated
     When navigates to "2x2_minutes" widget
     Then the "minutes_label" textfield with "[LANG:widget.widget_minutes_label]" text is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_hired" textfield with the "de ilimitados" format is displayed
      And the "last_update" textfield with the "A las \d\d:\d\d" format is displayed

  @jira.QANOV-476336 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User who updated the 2x2_data widget ">1" seconds can see the date since last update on the widget
    Given user has the "2x2_data" widget activated
      And user updated the widget ">1" seconds
     When navigates to "2x2_data" widget
     Then the "last_update" textfield with the "a las \d{2}:\d{2}" format is displayed

  @jira.QANOV-476337 @android @automation.hard @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with extra charges can see his/her charges in red on the Account widget
    Given user has a "mobile_line" product with extra charges
      And user has the "2x2_extra_charges" widget activated
     When navigates to "2x2_extra_charges" widget
     Then the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "\d+,\d\d €" format is displayed
      And the "extra_charges_value" textfield is displayed in "red" color
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed

  @jira.QANOV-476338 @android @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User without extra charges can see his/her charges in black on the Account widget
    Given user has a "mobile_line" product without extra charges
      And user has the "2x2_extra_charges" widget activated
     When navigates to "2x2_extra_charges" widget
     Then the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "0,00 €" format is displayed
      And the "extra_charges_value" textfield is displayed in "black" color
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User whose billing cycle ends in <time> day can see the end date
    We will add the date when the billing cycle ends:
    - If the end date is <1 day we will say today
    - If the end date is >1 day we will add the exact date
    Given user has the "2x2_extra_charges" widget activated
      And the billing cycle ends in "<time>" hour
     When goes to the Account widget
     Then the "end_date" textfield with the "<end_date>" format is displayed

    Examples:
          | time | end_date                     | jira_id      |
          | <1   | Hoy                          | QANOV-476339 |
          | >1   | Se reinicia el \d{2}/\d{2}   | QANOV-476340 |

  @jira.QANOV-476341 @android @automation.hard @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A user without extra charges can see the limited data usage and unlimited minutes on the Account widget
    Given user has a "mobile_line" product without extra charges
      And user has the "4x2_data_usage_and_minutes" widget activated
     When navigates to "4x2_data_usage_and_minutes" widget
     Then the "data_label" textfield with "[LANG:widget.widget_data_label]" text is displayed
      And the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "data_hired" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "minutes_label" textfield with "[LANG:widget.widget_minutes_label]" text is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_hired" textfield with the "de ilimitados" format is displayed
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed
      And the "last_update" textfield with the "A las \d\d:\d\d" format is displayed
      And the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "0,00 €" format is displayed
      And the "extra_charges_value" textfield is displayed in "white" color

  @jira.QANOV-476342 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User opens the app tapping on the Account widget
    Given user has the "any" widget activated
     When navigates to "any" widget
      And clicks on any widget
     Then the "Mobile Line Dashboard" page is displayed

  @jira.QANOV-476343 @android @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can refresh the widget on android devices
    Given user has the "any" widget activated
     When navigates to "any" widget
      And clicks on the "refresh_button" button
     Then the information of the Account widget is updated
      And the "last_update" textfield with the actual date time is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User can see the "2x2_data" Account widget adapted to dark mode
    If the mobile phone is set up with dark mode, the design will be adapted to dark mode automatically. Then, the widget
    background will change from white to black, and the textfields will change from black to white.
    Given user has the device set up with dark mode
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "o2es_icon" icon is displayed
      And the "phone_number" textfield is displayed in "white" color
      And the "data_consumption" textfield is displayed in "white" color
      And the "data_hired" textfield is displayed in "white" color
      And the "last_update" textfield is displayed in "white" color
      And the widget background is displayed in "black" color

  @jira.QANOV-476344 @android @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User who changes accounts has to configure the widget for the new account
    Given user has the "any" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
     Then the "widget_change_account_text" textfield with "[LANG:widget.widget_change_account_text]" text is displayed
      And the "widget_change_account_subtext" textfield with "[LANG:widget.widget_change_account_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_change_account_button]" text is displayed

  @jira.QANOV-476345 @android @automation.hard @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User who changes accounts can configure the widget for another line on Android devices
    Given user has the "small" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
      And clicks on the "configure_button" button
     Then the "Mobile Line Selection" page is displayed
      And the mobile line of the new account is displayed

  @jira.QANOV-476346 @automation.hard @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User who changes accounts can configure the widget for another line on iOS devices
    Given user has the "small" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration Widget" page is displayed
      And clicks on the element with "link" field with "Línea" value of the "option_list" list
      And the "Native Mobile Line Selection" page is displayed
      And the mobile line of the new account is displayed

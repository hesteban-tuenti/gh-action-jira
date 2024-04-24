# -*- coding: utf-8 -*-
@jira.QANOV-292384
Feature: Consumption information


  @jira.QANOV-292385 @android @automation.hard @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: User can see an error message in the Account widget if a general error happens
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And there is a general error in the widget
     Then the "widget_general_error_icon" icon is displayed
      And the "widget_general_error_text" textfield with "[LANG:widget.widget_general_error_text]" text is displayed
      And the "widget_general_error_subtext" textfield with "[LANG:widget.widget_general_error_subtext]" text is displayed

  @jira.QANOV-312785 @android @blaude @jira.cv.14.4 @manual @mobile @regression
  Scenario: Widget with data persisted from before receives an error when updating the info: old persisted data will be shown on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And clicks on the "refresh" button
     Then the information of the Account widget is updated with the persisted data
      And the "widget_update_time" textfield with the last update time is displayed
      And user turns off the Airplane mode

  @jira.QANOV-312780 @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: Widget with data persisted from before receives an error when updating the info: old persisted data will be shown on iOS devices
    widget info will be updated when user open her Today Screen
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And widget info is refreshed
     Then the information of the Account widget is updated with the persisted data
      And the "widget_update_time" textfield with the last update time is displayed
      And user turns off the Airplane mode

  @jira.QANOV-292386 @android @blaude @jira.cv.14.4 @manual @mobile @regression
  Scenario: Widget without data persisted from before receives an error when updating the info: error message will be shown on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And clicks on the "refresh" button
     Then the "widget_loading_error_icon" icon is displayed
      And the "widget_loading_error_text" textfield with "[LANG:widget.widget_loading_error_text]" text is displayed
      And the "widget_loading_error_link" link with "[LANG:widget.widget_loading_error_link]" text is displayed
      And user turns off the Airplane mode

  @jira.QANOV-312781 @blaude @ios @jira.cv.14.4 @jira.link.detects.IOS-8959 @manual @mobile @regression
  Scenario: Widget without data persisted from before receives an error when updating the info: error message will be shown on iOS devices
    widget info will be updated when user open her Today Screen
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And widget info is refreshed
     Then the "widget_loading_error_icon" icon is displayed
      And the "widget_loading_error_text" textfield with "[LANG:widget.widget_loading_error_text]" text is displayed
      And the "widget_loading_error_link" link with "[LANG:widget.widget_loading_error_link]" text is displayed
      And user turns off the Airplane mode

  @jira.QANOV-292387 @android @blaude @jira.cv.14.4 @jira.link.depends_on.QANOV-9375 @manual @mobile @regression
  Scenario: Widget without data persisted can retry to load the content in the Account widget on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And user turns off the Airplane mode
      And clicks on the "widget_loading_error_link" link
     Then widget content is loaded properly

  @jira.QANOV-312782 @android @automation.hard @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: User with several mobile lines, who cancel the mobile line have to configure the widget for another line
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
     Then the "widget_cancel_line_text" textfield with "[LANG:widget.widget_cancel_line_text]" text is displayed
      And the "widget_cancel_line_subtext" textfield with "[LANG:widget.widget_cancel_line_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_configure_button]" text is displayed

  @jira.QANOV-312783 @android @automation.hard @blaude @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-312782 @manual
  @mobile @regression
  Scenario: User with several mobile lines, who cancel the mobile line can configure the widget for another line
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
      And clicks on the "widget_configure_button" button
     Then the "Mobile Line Selection" page is displayed

  @jira.QANOV-312784 @android @automation.hard @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: User with one line, cancel the mobile line contract a contract message is shown in widget
    Given user has "1" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
     Then the "widget_cancel_line_text" textfield with "[LANG:widget.widget_cancel_line_text]" text is displayed
      And the "widget_cancel_line_subtext" textfield with "[LANG:widget.widget_cancel_line_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_cancel_button]" text is displayed

  @jira.QANOV-312786 @android @automation.hard @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: User who changes the rate and the types of consumption associated has to update the widget
    Given user has the "any" widget activated
     When changes the tariff
      And navigates to "Account" widget
     Then the "widget_change_tariff_text" textfield with "[LANG:widget.widget_change_tariff_text]" text is displayed
      And the "widget_change_tariff_subtext" textfield with "[LANG:widget.widget_change_tariff_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_change_tariff_button]" text is displayed

  @jira.QANOV-312787 @android @automation.hard @blaude @jira.cv.14.4 @jira.link.depends_on.QANOV-312786 @manual @mobile
  @regression
  Scenario: User with more than one line, who changes the rate and the types of consumption associated can update the widget on Android devices
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When changes the tariff
      And navigates to "Account" widget
      And clicks on the "widget_configure_button" button
     Then the "Mobile Line Selection" page is displayed

  @jira.QANOV-292388 @android @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: User cannot see the content in the Account widget if the user information is being updated
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And the user information is being updated
     Then the "updating_skeleton" element is displayed
      And the widget content is not loaded

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.4 @mobile @regression
  Scenario Outline: User without any <bundle_type> bundle activated will see a warning message in the Account widget
    Given user has the "<widget>" widget activated
      And user has no "<bundle_type>" bundle in "active" status
     When navigates to "<widget>" widget
     Then the "widget_no_active_bundle_error_text" textfield with "[LANG:widget.widget_no_active_bundle_text]" text is displayed
      And the "widget_no_active_bundle_error_link" link with "[LANG:widget.widget_no_active_bundle_link]" text is displayed

    Examples:
          | bundle_type | widget   | jira_id      |
          | data        | 2x2_data | QANOV-292389 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.4 @jira.link.depends_on.<depends_on> @jira.link.detects.IOS-8970
  @mobile @regression
  Scenario Outline: User without any <bundle_type> bundle activated can access to the "Bundle Management" screen from the Account widget
    Given user has the "<widget>" widget activated
      And user has no "<bundle_type>" bundle in "active" status
     When navigates to "<widget>" widget
      And clicks on the "no_active_bundle_error_link" link
     Then the "Account" page is displayed

    Examples:
          | bundle_type | widget   | depends_on   | jira_id      |
          | data        | 2x2_data | QANOV-292389 | QANOV-292391 |

  @jira.QANOV-292395 @android @automation.hard @blaude @ios @jira.cv.14.4 @manual @mobile @sanity @har
  Scenario: User can identify which line is displayed on the widget
    If the MSISDN is cut in the small widget, we will show ellipses at the beginning: ...04500430
    Given user has the "any" widget activated
     When navigates to "Account" widget
     Then the phone number of the mobile line for which the information was shown is displayed
      And the friendly name of the line is not displayed

  @jira.QANOV-292396 @android @blaude @jira.cv.14.4 @manual @mobile @regression
  Scenario: User can see a refresh button on the widget for android devices
    Given user has the "any" widget activated
     When navigates to "Account" widget
     Then the "refresh_button" button is displayed

  @jira.QANOV-292397 @android @automation.hard @ber @blaude @ios @jira.cv.14.8 @manual @mobile @sanity @raitt_drop1 @har
  Scenario: Postpay user can see the limited data usage in the Account Widget
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "von \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "end_date" textfield with the "noch \d{1,2} (Std.|Tage) gültig" format is displayed

  @jira.QANOV-292399 @android @blaude @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-292397 @manual @mobile @regression
  Scenario: Postpay user who has not made any consumption of the limited data allowance can see the allowance bar in gray in the Account widget
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "0%" of the "data" allowance in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_bar" allowance bar is displayed in "gray" color

  @jira.QANOV-292401 @android @blaude @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-292397 @manual @mobile @regression @har
  Scenario: Postpay user who has consumed less than 100% of the limited data allowance can see the allowance bar in blue in the Account widget
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_bar" allowance bar is displayed in "blue" color

  @jira.QANOV-376731 @android @blaude @ios @jira.2x2_data @jira.cv.14.4 @jira.link.depends_on.QANOV-292397 @manual @mobile
  @regression
  Scenario: Postpay user who has consumed 100% of the limited data allowance can see the allowance bar in red in the Account widget
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_bar" allowance bar is displayed in "red" color

  @jira.QANOV-292405 @android @automation.hard @ber @blaude @ios @jira.cv.14.8 @manual @mobile @smoke @raitt_drop1 @har
  Scenario: Prepay user can see the limited data usage in the Account Widget
    It will count the data usage for the last 30 days.
    Given user has a "prepay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "von \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "end_date" textfield with the "noch \d{1,2} (Std.|Tage) gültig" format is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario Outline: User who updated the <widget> widget ">1" seconds can see the date since last update on the widget
    We can force the update:
    - In iOS opening today screen
    - In Android tapping on refresh button
    Given the "<consumption_type>" allowance is limited in the "mobile_line" product
      And user has the "<widget>" widget activated
      And user updated the widget ">1" seconds
     When navigates to "<widget>" widget
     Then the "last_update" textfield with the "<last_update_format>" format is displayed

    Examples:
          | consumption_type | widget   | last_update_format | jira_id      |
          | data             | 2x2_data | um \d{2}:\d{2}     | QANOV-292408 |

  @jira.QANOV-292411 @android @blaude @ios @jira.cv.14.4 @jira.link.detects.ANDROID-13270 @mobile @smoke @manual @har
  Scenario: Prepay user with balance > 0 can see his/her balance in black on the Account widget
    Given user has a "prepay" account type
      And user has a ">0" balance
      And user has the "2x2_balance" widget activated
     When navigates to "2x2_balance" widget
     Then the "balance_label" textfield with "[LANG:widget.widget_balance_label]" text is displayed
      And the "balance_value" textfield with the "\d+,\d\d €" format is displayed
      And the "balance_value" textfield is displayed in "black" color

  @jira.QANOV-292412 @android @blaude @ios @jira.cv.14.4 @jira.link.detects.ANDROID-13266 @mobile @regression @har
  Scenario: Prepay user with balance 0 can see his/her balance in red on the Account widget
    Given user has a "prepay" account type
      And user has a "0" balance
      And user has the "2x2_balance" widget activated
     When navigates to "2x2_balance" widget
     Then the "balance_label" textfield with "[LANG:widget.widget_balance_label]" text is displayed
      And the "balance_value" textfield with "0,00 €" text is displayed
      And the "balance_value" textfield is displayed in "red" color

  @jira.QANOV-292418 @android @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: A prepay user who updated the 2x2_balance widget >1 seconds can see the date since last update on the widget
    We can force the update:
    - In iOS opening today screen
    - In Android tapping on refresh button
    Given user has a "prepay" account type
      And user has the "2x2_balance" widget activated
      And user updated the widget ">1" seconds
     When navigates to "2x2_balance" widget
     Then the "last_update" textfield with the "um \d{2}:\d{2}" format is displayed

  @jira.QANOV-292427 @android @blaude @ios @jira.cv.14.4 @manual @mobile @smoke @raitt_drop1 @har
  Scenario: User opens the app tapping on the Account widget
    Given user has the "any" widget activated
     When navigates to "any" widget
      And clicks on any widget
     Then the "Account" page is displayed

  @jira.QANOV-292428 @android @blaude @jira.cv.14.4 @manual @mobile @regression @har
  Scenario: User can refresh the widget on android devices
    Given user has the "any" widget activated
     When navigates to "any" widget
      And clicks on the "refresh_button" button
     Then the information of the Account widget is updated
      And the "last_update" textfield with the actual date time is displayed

  @jira.QANOV-292429 @android @blaude @ios @jira.cv.14.8 @jira.link.detects.ANDROID-13267 @manual @mobile @regression
  Scenario: User can see the "2x2_data" Account widget adapted to dark mode
    If the mobile phone is set up with dark mode, the design will be adapted to dark mode automatically. Then, the widget
    background will change from white to black, and the textfields will change from black to white.
    NOTE: After talking with the Android team, we conclude that changes between Dark-Light modes in Android 9 doesn't
    work properly because Google starts to support this natively from Android 10 and higher. No action can be performed
    to avoid this bad system behavior with UI modes for the Widgets.
    Given user has the device set up with dark mode
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "blaude_icon" icon is displayed
      And the "phone_number" textfield is displayed in "white" color
      And the "data_consumption" textfield is displayed in "white" color
      And the "data_hired" textfield is displayed in "white" color
      And the "end_date" textfield is displayed in "white" color
      And the widget background is displayed in "black" color

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.4 @jira.link.detects.ANDROID-13267 @manual @mobile @regression
  Scenario Outline: Prepay user can see the "2x2_balance" Account widget adapted to dark mode
    If the mobile phone is set up with dark mode, the design will be adapted to dark mode automatically. Then, the widget
    background will change from white to black, and the textfields will change from black to white.
    Given user has the device set up with dark mode
      And user has a "prepay" account type
      And user has a "<balance_value>" balance
      And user has the "2x2_balance" widget activated
     When navigates to "2x2_balance" widget
     Then the "blaude_icon" icon is displayed
      And the "phone_number" textfield is displayed in "white" color
      And the "balance_label" textfield is displayed in "white" color
      And the "balance_value" textfield is displayed in "<balance_color>" color
      And the widget background is displayed in "black" color

    Examples:
          | balance_value | balance_color | jira_id      |
          | >0            | white         | QANOV-292431 |
          | 0             | red           | QANOV-292432 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario Outline: User who has the <consumption_type> Account widget will see the consumption updated automatically each hour
    If the user is a postpay one, they can only install data widget.
    To test this scenario you can change the consumption in QA environment and wait an hour.
    NOTE: this functionality doesn't work in some devices like xiaomi and oneplus due to they limit the widget updates to save battery.
    Given user has the "any" widget activated
      And the "<consumption_type>" allowance is limited in the "mobile_line" product
      And user has the "any" widget activated
     When the "<consumption_type>" is updated for the user
      And waits "3600" seconds
     Then the "<consumption_type>_consumption" textfield is updated with the new value

    Examples:
          | consumption_type | jira_id      |
          | data             | QANOV-376732 |
          | balance          | QANOV-376733 |

  @jira.QANOV-405293 @android @ber @blaude @ios @jira.cv.14.8 @manual @mobile @sanity @raitt_drop1
  Scenario: Prepay user can see the limited units usage in the Account Widget
    Given user has a "prepay" account type
      And the "units" allowance is limited in the "mobile_line" product
      And user has the "2x2_units" widget activated
     When navigates to "2x2_units" widget
     Then the "units_consumption" textfield with the "\d+(\,\d{1,2})? Einheiten" format is displayed
      And the "units_hired" textfield with the "von \d+(\,\d{1,2})? Einheiten" format is displayed
      And the "units_usage.progress_bar" progress bar is displayed
      And the "end_date" textfield with the "noch \d{1,2} (Std.|Tage) gültig" format is displayed

  @jira.QANOV-405294 @android @blaude @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-405293 @manual @mobile @regression
  Scenario: Prepay user who has not made any consumption of the limited units allowance can see the allowance bar in gray in the Account widget
    Given user has a "prepay" account type
      And the "units" allowance is limited in the "mobile_line" product
      And user has consumed "0%" of the "units" allowance in the "mobile_line" product
      And user has the "2x2_units" widget activated
     When navigates to "2x2_units" widget
     Then the "units_bar" allowance bar is displayed in "gray" color

  @jira.QANOV-405295 @android @blaude @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-405293 @manual @mobile @regression
  Scenario: Prepay user who has consumed less than 100% of the limited units allowance can see the allowance bar in blue in the Account widget
    Given user has a "prepay" account type
      And the "untis" allowance is limited in the "mobile_line" product
      And user has consumed ">0%" of the "units" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "units" allowance in the "mobile_line" product
      And user has the "2x2_units" widget activated
     When navigates to "2x2_units" widget
     Then the "units_bar" allowance bar is displayed in "blue" color

  @jira.QANOV-405296 @android @blaude @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-405293 @manual @mobile @regression
  Scenario: Prepay user who has consumed 100% of the limited units allowance can see the allowance bar in red in the Account widget
    Given user has a "prepay" account type
      And the "units" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "units" allowance in the "mobile_line" product
      And user has the "2x2_units" widget activated
     When navigates to "2x2_units" widget
     Then the "units_bar" allowance bar is displayed in "red" color

  @jira.QANOV-405297 @android @blaude @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-405293 @manual @mobile @regression
  Scenario: User who updated the units widget ">1" seconds can see the date since last update on the widget
    We can force the update:
    - In iOS opening today screen
    - In Android tapping on refresh button
    Given the "units" allowance is limited in the "mobile_line" product
      And user has the "2x2_units" widget activated
      And user updated the widget ">1" seconds
     When navigates to "2x2_units" widget
     Then the "last_update" textfield with the "um \d{2}:\d{2}" format is displayed

  @jira.QANOV-405646 @android @blaude @ios @jira.cv.14.8 @jira.link.detects.ANDROID-13267 @manual @mobile @regression
  Scenario: User can see the "2x2_units" Account widget adapted to dark mode
    If the mobile phone is set up with dark mode, the design will be adapted to dark mode automatically. Then, the widget
    background will change from white to black, and the textfields will change from black to white.
    NOTE: After talking with the Android team, we conclude that changes between Dark-Light modes in Android 9 doesn't
    work properly because Google starts to support this natively from Android 10 and higher. No action can be performed
    to avoid this bad system behavior with UI modes for the Widgets.
    Given user has the device set up with dark mode
      And the "units" allowance is limited in the "mobile_line" product
      And user has the "2x2_units" widget activated
     When navigates to "2x2_units" widget
     Then the "blaude_icon" icon is displayed
      And the "phone_number" textfield is displayed in "white" color
      And the "units_consumption" textfield is displayed in "white" color
      And the "units_hired" textfield is displayed in "white" color
      And the "end_date" textfield is displayed in "white" color
      And the widget background is displayed in "black" color

  @jira.QANOV-414939 @android @ios @blaude @jira.cv.14.7 @manual @mobile @regression
  Scenario: User can refresh the widget with no connectivity
    We can force the update:
    - In iOS opening today screen
    - In Android tapping on refresh button
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "any" widget
      And user updated the widget ">1" seconds
     Then the information of the Account widget is not updated
      And the previous usage data keeps showing
      And the "last_update" textfield is not updated
      And user turns off the Airplane mode

  @jira.QANOV-427574 @android @automation.hard @blaude @ios @jira.cv.14.7 @manual @mobile @regression
  Scenario: User who changes accounts has to configure the widget for the new account
    Given user has the "any" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
     Then the "widget_change_account_text" textfield with "[LANG:widget.widget_change_account_text]" text is displayed
      And the "widget_change_account_subtext" textfield with "[LANG:widget.widget_change_account_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_change_account_button]" text is displayed

  @jira.QANOV-427575 @android @automation.hard @blaude @jira.cv.14.7 @jira.link.depends_on.QANOV-427574 @manual @mobile
  @regression @har
  Scenario: User who changes accounts can configure the widget for another line on Android devices
    Given user has the "small" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
      And clicks on the "configure_button" button
     Then the "Mobile Line Selection" page is displayed
      And the mobile line of the new account is displayed

  @jira.QANOV-427576 @automation.hard @blaude @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-427574 @manual @mobile
  @regression @har
  Scenario: User who changes accounts can configure the widget for another line on iOS devices
    Given user has the "small" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
      And long clicks over the widget
      And clicks on the "Edit widget" link
     Then the "Native Configuration Widget" page is displayed
      And clicks on the element with "link" field with "Vertrag" value of the "option_list" list
      And the "Native Mobile Line Selection" page is displayed
      And the mobile line of the new account is displayed
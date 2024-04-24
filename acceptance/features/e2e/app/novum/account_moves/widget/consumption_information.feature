# -*- coding: utf-8 -*-
@jira.QANOV-9336
Feature: Consumption information


  @jira.QANOV-312894 @android @automation.hard @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: User can see an error message in the Account widget if a general error happens
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And there is a general error in the widget
     Then the "widget_general_error_icon" icon is displayed
      And the "widget_general_error_text" textfield with "[LANG:widget.widget_general_error_text]" text is displayed
      And the "widget_general_error_subtext" textfield with "[LANG:widget.widget_general_error_subtext]" text is displayed

  @jira.QANOV-9373 @android @jira.cv.10.5 @no_automatable @mobile @moves @regression
  Scenario: Widget with data persisted from before receives an error when updating the info: old persisted data will be shown on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And clicks on the "refresh" button
     Then the information of the Account widget is updated with the persisted data
      And the "widget_update_time" textfield with the last update time is displayed
      And user turns off the Airplane mode

  @jira.QANOV-312895 @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: Widget with data persisted from before receives an error when updating the info: old persisted data will be shown on iOS devices
    widget info will be updated when user open her Today Screen
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And widget info is refreshed
     Then the information of the Account widget is updated with the persisted data
      And the "widget_update_time" textfield with the last update time is displayed
      And user turns off the Airplane mode

  @jira.QANOV-312896 @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: Widget without data persisted from before receives an error when updating the info: error message will be shown on iOS devices
    widget info will be updated when user open her Today Screen
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And widget info is refreshed
     Then the "widget_loading_error_icon" icon is displayed
      And the "widget_loading_error_text" textfield with "[LANG:widget.widget_loading_error_text]" text is displayed
      And user turns off the Airplane mode

  @jira.QANOV-312897 @android @jira.cv.14.1 @jira.link.depends_on.QANOV-9375 @no_automatable @mobile @moves
  @regression
  Scenario: Widget without data persisted can retry to load the content in the Account widget on Android devices
    Given user has the "any" widget activated
      And user turns on the Airplane mode
     When navigates to "Account" widget
      And user turns off the Airplane mode
      And clicks on the "widget_loading_error_link" link
     Then widget content is loaded properly

  @jira.QANOV-312898 @android @automation.hard @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: User with several mobile lines, who cancel a mobile line have to configure the widget for another line
    Can be tested installing the widget for a line, logging out from that account and logging in with other account
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
     Then the "widget_cancel_line_text" textfield with "[LANG:widget.widget_cancel_line_text]" text is displayed
      And the "widget_cancel_line_subtext" textfield with "[LANG:widget.widget_cancel_line_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_configure_button]" text is displayed

  @jira.QANOV-312899 @android @automation.hard @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-312898 @no_automatable @mobile
  @moves @regression
  Scenario: User with several mobile lines, who cancel a mobile line can configure the widget for another line
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
      And clicks on the "widget_configure_button" button
     Then the "Mobile Line Selection" page is displayed

  @jira.QANOV-312900 @android @automation.hard @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: User with one line, cancel the mobile line contract a contract message is shown in widget
    Given user has "1" mobile lines
      And user has the "any" widget activated
     When cancel a mobile line
      And navigates to "Account" widget
     Then the "widget_cancel_line_text" textfield with "[LANG:widget.widget_cancel_line_text]" text is displayed
      And the "widget_cancel_line_subtext" textfield with "[LANG:widget.widget_cancel_line_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_cancel_button]" text is displayed

  @jira.QANOV-312901 @android @automation.hard @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: User who changes the rate and the types of consumption associated has to update the widget
    Given user has the "any" widget activated
     When changes the tariff
      And navigates to "Account" widget
     Then the "widget_change_tariff_text" textfield with "[LANG:widget.widget_change_tariff_text]" text is displayed
      And the "widget_change_tariff_subtext" textfield with "[LANG:widget.widget_change_tariff_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_change_tariff_button]" text is displayed

  @jira.QANOV-312902 @android @automation.hard @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-312901 @no_automatable @mobile
  @moves @regression
  Scenario: User with more than one line, who changes the rate and the types of consumption associated can update the widget
    Given user has "several" mobile lines
      And user has the "any" widget activated
     When changes the tariff
      And navigates to "Account" widget
      And clicks on the "widget_configure_button" button
     Then the "Mobile Line Selection" page is displayed

  @jira.QANOV-312903 @android @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: User cannot see the content in the Account widget if the user information is being updated
    ios: widget info will be updated when user open her Today Screen
    android: widget can be refreshed with refresh button
    Given user has the "any" widget activated
     When navigates to "Account" widget
      And the user information is being updated
     Then the "updating_skeleton" element is displayed
      And the widget content is not loaded

  @jira.<jira_id> @android @ios @jira.cv.14.1 @mobile @moves @regression
  Scenario Outline: User without any <bundle_type> bundle activated will see a warning message in the Account widget
    Given user has the "<widget>" widget activated
      And user has no "<bundle_type>" bundle in "active" status
     When navigates to "<widget>" widget
     Then the "widget_no_active_bundle_error_text" textfield with "[LANG:widget.widget_no_active_bundle_text]" text is displayed
      And the "widget_no_active_bundle_error_link" link with "[LANG:widget.widget_no_active_bundle_link]" text is displayed

    Examples:
          | bundle_type | widget      | jira_id      |
          | data        | 2x2_data    | QANOV-312904 |
          | minutes     | 2x2_minutes | QANOV-312905 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on> @mobile @moves @regression
  Scenario Outline: User without any <bundle_type> bundle activated can access to the "Bundle Management" screen from the Account widget
    Given user has the "<widget>" widget activated
      And user has no "<bundle_type>" bundle in "active" status
     When navigates to "<widget>" widget
      And clicks on the "no_active_bundle_error_link" link
     Then the "Dashboard" page is displayed

    Examples:
          | bundle_type | widget      | depends_on   | jira_id      |
          | data        | 2x2_data    | QANOV-312904 | QANOV-312906 |
          | minutes     | 2x2_minutes | QANOV-312905 | QANOV-312907 |

  @jira.QANOV-9342 @android @automation.hard @ios @jira.cv.10.5 @no_automatable @mobile @moves @sanity @har
  Scenario: User can identify which line is displayed on the widget
    If the MSISDN is cut in the small widget, we will show ellipses at the beginning: ...04500430
    Given user has the "any" widget activated
     When navigates to "Account" widget
     Then the phone number of the mobile line for which the information was shown is displayed
      And the friendly name of the line is not displayed

  @jira.QANOV-312908 @android @automation.hard @ios @jira.cv.14.8 @no_automatable @mobile @moves @sanity @har @ber
  Scenario: Postpay user can see the limited data usage in the Account Widget
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
     Then the "last_update" textfield with the "a las \d{2}:\d{2}" format is displayed

  @jira.QANOV-312909 @android @automation.hard @ios @jira.cv.14.8 @no_automatable @mobile @moves @smoke @har
  Scenario: Postpay user can see the limited minutes usage in the Account Widget
    Given user has a "postpay" account type
      And the "minutes" allowance is limited in the "mobile_line" product
      And user has the "2x2_minutes" widget activated
     When navigates to "2x2_minutes" widget
     Then the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_hired" textfield with the "de \d+ min" format is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "end_date" textfield with the "Termina en \d{1,2} (horas|días)" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on> @no_automatable @mobile @moves
  @regression
  Scenario Outline: Postpay user who has not made any consumption of the limited <consumption_type> allowance can see the allowance bar in gray in the Account widget
    Given user has a "postpay" account type
      And the "<consumption_type>" allowance is limited in the "mobile_line" product
      And user has consumed "0%" of the "<consumption_type>" allowance in the "mobile_line" product
      And user has the "<widget>" widget activated
     When navigates to "<widget>" widget
     Then the "<consumption_type>_bar" allowance bar is displayed in "gray" color

    Examples:
          | consumption_type | widget      | depends_on   | jira_id      |
          | data             | 2x2_data    | QANOV-312908 | QANOV-312910 |
          | minutes          | 2x2_minutes | QANOV-312909 | QANOV-312911 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on> @no_automatable @mobile @moves
  @regression @har
  Scenario Outline: Postpay user who has consumed less than 100% of the limited <consumption_type> allowance can see the allowance bar in blue in the Account widget
    Given user has a "postpay" account type
      And the "<consumption_type>" allowance is limited in the "mobile_line" product
      And user has consumed ">0%" of the "<consumption_type>" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "<consumption_type>" allowance in the "mobile_line" product
      And user has the "<widget>" widget activated
     When navigates to "<widget>" widget
     Then the "<consumption_type>_bar" allowance bar is displayed in "blue" color

    Examples:
          | consumption_type | widget      | depends_on   | jira_id      |
          | data             | 2x2_data    | QANOV-312908 | QANOV-312912 |
          | minutes          | 2x2_minutes | QANOV-312909 | QANOV-312913 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @jira.link.depends_on.<depends_on> @no_automatable @mobile @moves
  @regression
  Scenario Outline: Postpay user who has consumed 100% of the limited <consumption_type> allowance can see the allowance bar in red in the Account widget
    Given user has a "postpay" account type
      And the "<consumption_type>" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "<consumption_type>" allowance in the "mobile_line" product
      And user has the "<widget>" widget activated
     When navigates to "<widget>" widget
     Then the "<consumption_type>_bar" allowance bar is displayed in "red" color

    Examples:
          | consumption_type | widget      | depends_on   | jira_id      |
          | data             | 2x2_data    | QANOV-312908 | QANOV-312914 |
          | minutes          | 2x2_minutes | QANOV-312909 | QANOV-312915 |

  @jira.QANOV-312916 @android @automation.hard @ios @jira.cv.14.1 @no_automatable @mobile @moves @smoke @har
  Scenario: Postpay user can see the unlimited data usage in the Account Widget
    We will add the date when the billing cycle or the timed based pack ends:
    - If the end date is <1 day we will say today
    - If the end date is >1 day we will add the exact date
    End date will not shown, if this is not returned by the API
    Given user has a "postpay" account type
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_label" textfield with "[LANG:widget.widget_data_label]" text is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "de ilimitados" format is displayed
      And the "end_date" textfield with the "(Hoy|Hasta \d{2}/\d{2})" format is displayed

  @jira.QANOV-312917 @android @automation.hard @ios @jira.cv.14.1 @no_automatable @mobile @moves @smoke @har
  Scenario: Postpay user can see the unlimited minutes usage in the Account Widget
    The date when the billing cycle ends will be displayed only when i'ts available via API:
    - If the end date is <1 day we will say today
    - If the end date is >1 day we will add the exact date
    End date will not shown, if this is not returned by the API
    Given user has a "postpay" account type
      And the "minutes" allowance is unlimited in the "mobile_line" product
      And user has the "2x2_minutes" widget activated
     When navigates to "2x2_minutes" widget
     Then the "minutes_label" textfield with "[LANG:widget.widget_minutes_label]" text is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_hired" textfield with the "de ilimitados" format is displayed
      And the "end_date" textfield with the "(Hoy|Hasta \d{2}/\d{2})" format is displayed

  @jira.QANOV-312922 @android @ios @jira.cv.14.8 @mobile @moves @no_automatable @regression
  Scenario: A Legado prepay user can see the limited data usage in the Account Widget
    It will count the data usage for the last 30 days.
    Given user has a "legado prepay" account type
      And user has the "2x2_data" widget activated
     When navigates to "2x2_data" widget
     Then the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "de \d+ min" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "end_date" textfield with the "Termina en \d{1,2} (horas|días)" format is displayed

  @jira.QANOV-312923 @ios @jira.cv.14.8 @mobile @moves @no_automatable @regression
  Scenario: A Legado prepay user can see the limited minutes usage in the Account Widget
    It will count the data usage for the last 30 days.
    Given user has a "legado prepay" account type
      And the "minutes" allowance is limited in the "mobile_line" product
      And user has the "2x2_minutes" widget activated
     When navigates to "2x2_minutes" widget
     Then the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "end_date" textfield with the "Termina en \d{1,2} (horas|días)" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
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
          | consumption_type | widget      | last_update_format  | jira_id      |
          | data             | 2x2_data    | a las \d{2}:\d{2}   | QANOV-312925 |
          | minutes          | 2x2_minutes | a las \d{2}:\d{2}   | QANOV-312927 |

  @jira.QANOV-312928 @android @ios @jira.cv.14.1 @mobile @moves @no_automatable @regression
  Scenario: Legado prepay user with balance > 0 can see his/her balance in black on the Account widget
    Given user has a "legado prepay" account type
      And user has a ">0" balance
      And user has the "2x2_balance" widget activated
     When navigates to "2x2_balance" widget
     Then the "balance_label" textfield with "[LANG:widget.widget_balance_label]" text is displayed
      And the "balance_value" textfield with the "\d+,\d\d €" format is displayed
      And the "balance_value" textfield is displayed in "black" color

  @jira.QANOV-312929 @android @ios @jira.cv.14.1 @mobile @moves @no_automatable @regression
  Scenario: Legado prepay user with balance 0 can see his/her balance in red on the Account widget
    Given user has a "legado prepay" account type
      And user has a "0" balance
      And user has the "2x2_balance" widget activated
     When navigates to "2x2_balance" widget
     Then the "balance_label" textfield with "[LANG:widget.widget_balance_label]" text is displayed
      And the "balance_value" textfield with "0,00 €" text is displayed
      And the "balance_value" textfield is displayed in "red" color

  @jira.QANOV-312930 @android @automation.hard @ios @jira.cv.14.8 @mobile @moves @smoke
  Scenario: Postpay with extra charges can see his/her charges in red on the Account widget
    Given user has a "postpay" account type
      And user has a "mobile_line" product with extra charges
      And user has the "2x2_extra_charges" widget activated
     When navigates to "2x2_extra_charges" widget
     Then the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "\d+,\d\d €" format is displayed
      And the "extra_charges_value" textfield is displayed in "red" color
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed

  @jira.QANOV-312931 @android @automation.hard @ios @jira.cv.14.8 @mobile @moves @smoke @har
  Scenario: Postpay without extra charges can see his/her charges in black on the Account widget
    Given user has a "postpay" account type
      And user has a "mobile_line" product without extra charges
      And user has the "2x2_extra_charges" widget activated
     When navigates to "2x2_extra_charges" widget
     Then the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "0,00 €" format is displayed
      And the "extra_charges_value" textfield is displayed in "black" color
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.1 @mobile @moves @regression
  Scenario Outline: A <account_type> user who updated the <widget> widget ">1" seconds can see the date since last update on the widget
    We can force the update:
    - In iOS opening today screen
    - In Android tapping on refresh button
    Given user has a "<account_type>" account type
      And user has the "<widget>" widget activated
      And user updated the widget ">1" seconds
     When navigates to "<account_type>" widget
     Then the "last_update" textfield with the "<last_update_format>" format is displayed

    @no_automatable
    Examples:
          | account_type  | widget      | last_update_format  | jira_id      |
          | legado prepay | 2x2_balance | a las \d{2}:\d{2}   | QANOV-312933 |

    @no_automatable
    Examples:
          | account_type | widget            | last_update_format  | jira_id      |
          | prepay       | 2x2_balance       | a las \d{2}:\d{2}   | QANOV-312933 |
          | postpay      | 2x2_extra_charges | a las \d{2}:\d{2}   | QANOV-312935 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario Outline: Postpay user whose billing cycle ends in <time> day can see the end date
    We will add the date when the billing cycle ends:
    - If the end date is <1 day we will say today
    - If the end date is >1 day we will add the exact date
    Given user has a "postpay" account type
      And user has the "2x2_extra_charges" widget activated
      And the billing cycle ends in "<time>" hour
     When goes to the Account widget
     Then the "end_date" textfield with the "<end_date>" format is displayed

    Examples:
          | time | end_date                   | jira_id      |
          | <1   | Hoy                        | QANOV-312936 |

    @har
    Examples:
          | time | end_date                   | jira_id      |
          | >1   | Se reinicia el \d{2}/\d{2} | QANOV-312937 |

  @jira.QANOV-312938 @android @automation.hard @ios @jira.cv.14.1 @mobile @moves @smoke @har
  Scenario: A postpay user with extra charges can see the unlimited data usage and unlimited minutes on the Account widget
    Given user has a "postpay" account type
      And the "data" allowance is unlimited in the "mobile_line" product
      And the "minutes" allowance is unlimited in the "mobile_line" product
      And user has a "mobile_line" product with extra charges
      And user has the "4x2_data_usage_and_minutes" widget activated
     When navigates to "4x2_data_usage_and_minutes" widget
     Then the "data_label" textfield with "[LANG:widget.widget_data_label]" text is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_hired" textfield with the "de ilimitados" format is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "minutes_label" textfield with "[LANG:widget.widget_minutes_label]" text is displayed
      And the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_hired" textfield with the "de ilimitados" format is displayed
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed
      And the "last_update" textfield with the "(Hace \d+ minutos|a las \d{2}:\d{2})" format is displayed
      And the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "\d+,\d\d €" format is displayed
      And the "extra_charges_value" textfield is displayed in "red" color

  @jira.QANOV-312939 @android @ios @jira.cv.14.1 @mobile @moves @smoke @har
  Scenario: A postpay user without extra charges can see the limited data usage and unlimited minutes on the Account widget
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And the "minutes" allowance is unlimited in the "mobile_line" product
      And user has a "mobile_line" product without extra charges
      And user has the "4x2_data_usage_and_minutes" widget activated
     When navigates to "4x2_data_usage_and_minutes" widget
     Then the "data_label" textfield with "[LANG:widget.widget_data_label]" text is displayed
      And the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "data_hired" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "minutes_label" textfield with "[LANG:widget.widget_minutes_label]" text is displayed
      And the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_hired" textfield with the "de ilimitados" format is displayed
      And the "end_date" textfield with the "(Hoy|Se reinicia el \d{2}/\d{2})" format is displayed
      And the "last_update" textfield with the "(Hace \d+ minutos|a las \d{2}:\d{2})" format is displayed
      And the "extra_charges_label" textfield with "[LANG:widget.widget_extra_charges_label]" text is displayed
      And the "extra_charges_value" textfield with the "0,00 €" format is displayed
      And the "extra_charges_value" textfield is displayed in "white" color

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.1 @mobile @moves @no_automatable
  Scenario Outline: Legado prepay user with balance <balance_value> can see the data usage, minutes and the balance on the Account widget
    Given user has a "legado prepay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And the "minutes" allowance is limited in the "mobile_line" product
      And user has a "<balance_value>" balance
      And user has the "4x2_data_usage_and_minutes" widget activated
     When navigates to "4x2_data_usage_and_minutes" widget
     Then the "data_label" textfield with "[LANG:widget.widget_data_label]" text is displayed
      And the "data_consumption" textfield with the "\d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "data_hired" textfield with the "de \d+(\,\d{1,2})? (MB|GB)" format is displayed
      And the "minutes_label" textfield with "[LANG:widget.widget_minutes_label]" text is displayed
      And the "minutes_consumption" textfield with the "\d+ min" format is displayed
      And the "minutes_usage.progress_bar" progress bar is displayed
      And the "minutes_hired" textfield with the "de \d+ min" format is displayed
      And the "balance_label" textfield with "[LANG:widget.widget_balance_label]" text is displayed
      And the "balance_value" textfield with the "\d+,\d\d €" format is displayed
      And the "balance_value" textfield is displayed in "<balance_color>" color
      And the "last_update" textfield with the "(Hace \d+ minutos|a las \d{2}:\d{2})" format is displayed

    Examples:
          | balance_value | balance_color | test_priority | jira_id      |
          | >0            | black         | smoke         | QANOV-312940 |
          | 0             | red           | regression    | QANOV-312941 |

  @jira.QANOV-9394 @android @ios @jira.cv.14.1 @no_automatable @mobile @moves @smoke @har
  Scenario: User opens the app tapping on the Account widget
    Given user has the "any" widget activated
     When navigates to "any" widget
      And clicks on any widget
     Then the "Mobile Line Dashboard" page is displayed

  @jira.QANOV-9357 @android @jira.cv.14.1 @no_automatable @mobile @moves @regression
  Scenario: User can refresh the widget on android devices
    Given user has the "any" widget activated
     When navigates to "any" widget
      And clicks on the "refresh_button" button
     Then the information of the Account widget is updated
      And the "last_update" textfield with the actual date time is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.8 @no_automatable @mobile @moves @regression
  Scenario Outline: User can see the "2x2_<consumption_type>" Account widget adapted to dark mode
    If the mobile phone is set up with dark mode, the design will be adapted to dark mode automatically. Then, the widget
    background will change from white to black, and the textfields will change from black to white.
    Given user has the device set up with dark mode
      And the "<consumption_type>" allowance is limited in the "mobile_line" product
      And user has the "2x2_<consumption_type>" widget activated
     When navigates to "2x2_<consumption_type>" widget
     Then the "movistar_icon" icon is displayed
      And the "phone_number" textfield is displayed in "white" color
      And the "<consumption_type>_consumption" textfield is displayed in "white" color
      And the "<consumption_type>_hired" textfield is displayed in "white" color
      And the "end_date" textfield is displayed in "white" color
      And the widget background is displayed in "black" color

    Examples:
          | consumption_type | jira_id      |
          | data             | QANOV-312942 |
          | minutes          | QANOV-312943 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @mobile @moves @no_automatable @regression
  Scenario Outline: Legado prepay user can see the "2x2_balance" Account widget adapted to dark mode
    If the mobile phone is set up with dark mode, the design will be adapted to dark mode automatically. Then, the widget
    background will change from white to black, and the textfields will change from black to white.
    Given user has the device set up with dark mode
      And user has a "legado prepay" account type
      And user has a "<balance_value>" balance
      And user has the "2x2_balance" widget activated
     When navigates to "2x2_balance" widget
     Then the "movistar_icon" icon is displayed
      And the "phone_number" textfield is displayed in "white" color
      And the "balance_label" textfield is displayed in "white" color
      And the "balance_value" textfield is displayed in "<balance_color>" color
      And the widget background is displayed in "black" color

    Examples:
          | balance_value | balance_color | jira_id      |
          | >0            | white         | QANOV-312944 |
          | 0             | red           | QANOV-312945 |

  @jira.<jira_id> @android @ios @jira.cv.14.4 @no_automatable @mobile @moves @regression
  Scenario Outline: User who has the <consumption_type> Account widget will see the consumption updated automatically each hour
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
          | data             | QANOV-376736 |
          | minutes          | QANOV-376737 |
          | charges          | QANOV-376738 |
          | balance          | QANOV-376739 |

  @jira.QANOV-414940 @android @ios @jira.cv.14.8 @no_automatable @mobile @moves @regression
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

  @jira.QANOV-427580 @android @automation.hard @ios @jira.cv.14.7 @no_automatable @mobile @moves @regression
  Scenario: User who changes accounts has to configure the widget for the new account
    Given user has the "any" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
     Then the "widget_change_account_text" textfield with "[LANG:widget.widget_change_account_text]" text is displayed
      And the "widget_change_account_subtext" textfield with "[LANG:widget.widget_change_account_subtext]" text is displayed
      And the "widget_configure_button" button with "[LANG:widget.widget_change_account_button]" text is displayed

  @jira.QANOV-427581 @android @automation.hard @jira.cv.14.7 @jira.link.depends_on.QANOV-427580 @no_automatable @mobile @moves
  @regression
  Scenario: User who changes accounts can configure the widget for another line on Android devices
    Given user has the "small" widget activated
      And logs out from the application
      And logs in the application with a different account
     When navigates to "Account" widget
      And clicks on the "configure_button" button
     Then the "Mobile Line Selection" page is displayed
      And the mobile line of the new account is displayed

  @jira.QANOV-427582 @automation.hard @ios @jira.cv.14.7 @jira.link.depends_on.QANOV-427580 @no_automatable @mobile @moves
  @regression @har
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

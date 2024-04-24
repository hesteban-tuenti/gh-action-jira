# -*- coding: utf-8 -*-
@jira.QANOV-126311
Feature: Consumption Extra Charges


  @jira.QANOV-5205 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136658
  @manual @mobile @o2uk @smoke
  Scenario: A legacy user can access to the Data extra charges from the Data consumption screen
    internal_checkpoint="The data_type field will include 'Mobile Data' and can include the secondary type (Roaming)
    if it applies."
    commented_tags="@depends_on.NOV-136656"
    Given user has a "legacy postpay" account type
      And user has "charged" events in the "data" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user has the "extra-charges-aggregated" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_usage.extra_charges" entrypoint
     Then the "Data Extra Charges" page is displayed
      And the "Data extra charges" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Your bill closes in DD days" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "DD Mmm - DD Mmm" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with the "£X.XX" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph" graph is displayed
      And the billing period is displayed in the "extra_charges_graph.x" axis
      And the charges are displayed in the "extra_charges_graph.y" axis
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "extra_charges_graph" graph
      And the "extra_charges_graph.y.selected_day_label" line is displayed in the "last" day
      And the "extra_charges_graph.y.selected_day_label" textfield with the "DD Mmm · £X.XX" format is displayed
      And the "extra_charges_event_list" list is displayed
      And each element in the "extra_charges_event_list" list has the "data_icon" icon
      And each element in the "extra_charges_event_list" list has the "consumption" field
      And each element in the "extra_charges_event_list" list has the "cost" textfield with the "£X.XX" format
      And each element in the "extra_charges_event_list" list has the "data_type" field
      And the elements in the "extra_charges_event_list" list are ordered by date descendant

  @jira.QANOV-5207 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5205 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136896 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the Late landing charges in the Data extra charges screen
    Given user has a "legacy postpay" account type
      And user has "late_landing_charges" type of "data" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user is in the "Data Extra Charges" page
     Then the "late_landing_charges" module with "Late landing charges" title is displayed
      And the "late_landing_charges.amount" textfield with the "£X.XX" format is displayed
      And the "late_landing_charges.description" textfield with "Charges from previous bills charged now" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.detail]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.consumption]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.data_type]" textfield with "Late landing" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.cost]" textfield with the "£X.XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.view_details]" link with "View details" text is displayed

  @jira.QANOV-5208 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5207 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136897 @manual @mobile @o2uk @regression
  Scenario: A legacy ser can see the late landing charges details of the data extra charges from the data extra charges screen
    Given user has a "legacy postpay" account type
      And user has "late_landing_charges" type of "data" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user is in the "Data Extra Charges" page
     When clicks on the "[CONTEXT:extra_charges_event_list.element.view_details]" link
     Then the "Late Landing Charges" page is displayed
      And the "Late landing charges" header is displayed
      And the "what_are" textfield with "What are the late landing charges?" text is displayed
      And the "description" textfield is displayed

  @jira.QANOV-5209 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136657 @live @mobile @next @o2uk @sanity @webapp
  Scenario: A legacy user without "Data" extra charges accesses to the Data extra charges screen
    commented_tags="@depends_on.NOV-136655"
    other_affected_versions="2021-46"
    Given user has a "legacy postpay" account type
      And user has "none" events in the "data" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_usage.extra_charges" entrypoint
     Then the "Data Extra Charges" page is displayed
      And the "Data extra charges" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "[Your bill closes in \d+ days|Your billing cycle ended \d+ days ago]" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with "£0.00" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "extra_charges_graph" graph is not displayed
      And the "extra_charges_list.empty_case.icon" icon is displayed
      And the "extra_charges_list.empty_case.title" textfield is displayed
      And the "extra_charges_list.empty_case.description" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Consumption" page is displayed
      And the "data" tab is selected

  @jira.QANOV-5211 @android @ios @jira.cv.12.4 @jira.link.detects.OBO2UK-1440 @jira.link.parent_test_plan.QANOV-24140
  @manual @mobile @o2uk @smoke
  Scenario: An AO2 user can access to the Data extra charges webview from the Data consumption screen
    Given user has a "AO2 postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_usage.extra_charges" entrypoint
     Then the internal webview is displayed
      And the "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Consumption" page is displayed

  @jira.QANOV-5213 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.detects.O2UK-3292
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136680 @live @mobile @next @o2uk @sanity @webapp
  Scenario: A legacy user can access to the Minutes extra charges screen from the Minutes consumption screen
    internal_checkpoint="CERT0: set532@test.com
    - the 'number' field in the events will be the contact name when the phone number is stored as a contact
    - the 'minutes_icon' will be the avatar from the contact in case the phone number is stored having an avatar image
    - the 'call_type' field can be: Call, Roaming Call, Premium Services"
    commented_tags="@depends_on.NOV-136679"
    Given user has a "legacy PAYM" account type
      And user has "charged" events in the "minutes:international_minutes" category of recent charges
      And user does not have late landing charges in the "minutes" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user has the "extra-charges-aggregated" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage.extra_charges" element is visible
      And clicks on the "minutes_usage.extra_charges" entrypoint
     Then the "Minutes Extra Charges" page is displayed
      And the "Minutes extra charges" header is displayed
      And the selected day line is displayed in the "last" day of the "extra_charges_graph" graph
      And the "extra_charges_title.expiration_date" textfield with the "Your billing cycle ended (\d+,\d{3}|\d+) days ago|Your bill closes in \d+ days" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "extra_charges_graph" graph
      And the "extra_charges_graph.y.selected_day_label" textfield with the "\d+ [A-z]{3} · £\d+.\d\d" format is displayed
      And the "extra_charges_list.events" list is displayed
      And each element in the "extra_charges_list.events" list has the "icon" field
      And each element in the "extra_charges_list.events" list has the "phonenumber" field
      And each element in the "extra_charges_list.events" list has the "price" textfield with the "£\d+.\d\d" format
      And each element in the "extra_charges_list.events" list has the "icon_received_send" field
      And each element in the "extra_charges_list.events" list has the "duration" textfield with the "^\d{1,2}:\d{2}( \d+\w+)+$" format
      And each element in the "extra_charges_list.events" list has the "type_of_call" field
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant

  @jira.QANOV-5214 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5213 @jira.link.detects.O2UK-2979
  @jira.link.detects.O2UK-3411 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136894 @manual @mobile
  @o2uk @regression
  Scenario: A legacy user can see the Late landing charges in the Minutes extra charges screen
    Given user has a "legacy PAYM" account type
      And user has late landing charges in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Minutes Extra Charges" page
     Then the "[CONTEXT:extra_charges_event_list.element.minutes_icon]" icon is displayed
      And the "[CONTEXT:extra_charges_event_list.element.number]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.cost]" textfield with the "£X.XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.time_stamp]" textfield with the "XX:XX XXh XXmin XXs" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.call_type]" textfield with "Call" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.late_landing_description]" textfield with "Late landing charges" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.view_details]" link with "View details" text is displayed

  @jira.QANOV-5215 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5214 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136685 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the late landing charges details from the Minutes extra charges screen
    Given user has a "legacy PAYM" account type
      And user has late landing charges in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Minutes Extra Charges" page
     When clicks on the "[CONTEXT:extra_charges_event_list.element.view_details]" link
     Then the "Late Landing Charges" page is displayed
      And the "Late landing charges" header is displayed
      And the "what_are" textfield with "What are the late landing charges?" text is displayed
      And the "description" textfield is displayed

  @jira.QANOV-5216 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5213 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136682 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the premium calls in the Minutes extra charges screen
    internal_checkpoint="CERT0: in01808o_699417@o2.com
    To find users with Premium calls use the call in the MW API:
    {{O2_API_BASE_URL}}/{{MSISDN}}/postpay/bill/recentcharges/voice/charges
    This call will return the call and the ones with the field 'isNGNCharge': true will be premium."
    Given user has a "legacy PAYM" account type
      And user has "premium calls" type of "minutes" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Minutes Extra Charges" page
     Then the "[CONTEXT:extra_charges_event_list.element.star_icon]" icon is displayed
      And the "[CONTEXT:extra_charges_event_list.element.number]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.cost]" textfield with the "£X.XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.time_stamp]" textfield with the "XX:XX XXh XXmin XXs" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.call_type]" textfield containing "Premium services" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.premium_description]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.view_details]" link with "View details" text is displayed

  @jira.QANOV-5217 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5216 @jira.link.detects.O2UK-3415
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136683 @manual @mobile @o2uk @regression
  Scenario: A legacy user can see the details of a premium call from the Minutes extra charges screen
    Given user has a "legacy PAYM" account type
      And user has "premium calls" type of "minutes" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Minutes Extra Charges" page
     When clicks on the "[CONTEXT:extra_charges_event_list.element.view_details]" link
     Then the browser webview is displayed
      And the "Premium Service Checker | Account and billing | Help & Support" header is displayed

  @jira.QANOV-5218 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136678 @live @mobile @next @o2uk @smoke @webapp
  Scenario: A legacy user without "Minutes" extra charges can access to the Minutes extra charges screen
    commented_tags="@depends_on.NOV-136676"
    other_affected_versions="2021-46"
    Given user has a "legacy PAYM" account type
      And user has "none" events in the "minutes" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage.extra_charges" element is visible
      And clicks on the "minutes_usage.extra_charges" entrypoint
     Then the "Minutes Extra Charges" page is displayed
      And the "extra_charges_title.expiration_date" textfield with the "[Your bill closes in \d+ days|Your billing cycle ended \d+ days ago]" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with "£0.00" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "extra_charges_graph" graph is not displayed
      And the "extra_charges_list.empty_case.icon" icon is displayed
      And the "extra_charges_list.empty_case.title" textfield is displayed
      And the "extra_charges_list.empty_case.description" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consumption" page is displayed
      And the "minutes" tab is selected

  @jira.QANOV-5220 @android @ios @jira.cv.12.4 @jira.link.detects.OBO2UK-1440 @jira.link.parent_test_plan.QANOV-24140
  @manual @mobile @o2uk @smoke
  Scenario: An AO2 user can access to the Minutes extra charges webview from the Minutes consumption screen
    Given user has a "AO2 PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And clicks on the "minutes_usage.extra_charges" entrypoint
     Then the internal webview is displayed
      And the "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Consumption" page is displayed

  @jira.QANOV-5222 @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136698
  @manual @mobile @o2uk @smoke
  Scenario: A legacy user can access to the Messages extra charges screen from the Messages consumption screen
    internal_checkpoint="CERT0: rbmuatlokesh_donotusee693@stf.ref.o2.co.uk (PAYM)
    The 'message_icon' and the 'number' fields will be displayed with the contact information if
    the user has the number saved as a contact and/or with an avatar.
    The 'message_type' field can be SMS or MMS and might show additional information (Roaming, Premium Service)."
    commented_tags="@depends_on.NOV-136696"
    Given user has any "legacy PAYM;legacy MBB" account types
      And user has "messages" extra charges
      And user has not "premium messages" type of "messages" extra charges
      And user has any allowance in the "mobile_line" product
      And user has not stored in the phonebook any phone number displayed in the "messages" events
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user has the "extra-charges-aggregated" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And clicks on the "messages_usage.extra_charges.value" entrypoint
     Then the "Messages Extra Charges" page is displayed
      And the "Messages extra charges" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "[Your bill closes in \d+ days|Your billing cycle ended \d+ days ago]" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with the "£\d+.\d\d" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph" graph is displayed
      And the billing period is displayed in the "extra_charges_graph.x" axis
      And the charges are displayed in the "extra_charges_graph.y" axis
      And the "daily_charges" bar is displayed for each day in the "y" axis of the "extra_charges_graph" graph
      And the "extra_charges_graph.y.selected_day_label" line is displayed in the "last" day
      And the "extra_charges_graph.y.selected_day_label" textfield with the "DD Mmm · £X.XX" format is displayed
      And the "extra_charges_event_list" list is displayed
      And each element in the "extra_charges_event_list" list has the "message_icon" icon
      And each element in the "extra_charges_event_list" list has the "number" field
      And each element in the "extra_charges_event_list" list has the "cost" textfield with the "£X.XX" format
      And each element in the "extra_charges_event_list" list has the "time_stamp" textfield with the "XX:XX" format
      And each element in the "extra_charges_event_list" list has the "message_type" field
      And each element in the "extra_charges_event_list" list has the "message_direction" field
      And the elements in the "extra_charges_event_list" list are ordered by date descendant

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5223
  @jira.link.detects.O2UK-3411 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136900 @manual @mobile
  @o2uk @regression
  Scenario Outline: A <account_type> user can see the Late landing charges in the Messages extra charges screen
    Given user has a "<account_type>" account type
      And user has "late_landing_charges" type of "messages" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Messages Extra Charges" page
     Then the "[CONTEXT:extra_charges_event_list.element.messages_icon]" icon is displayed
      And the "[CONTEXT:extra_charges_event_list.element.number]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.cost]" textfield with the "£X.XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.time_stamp]" textfield with the "XX:XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.message_type]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.late_landing_description]" textfield containing "Late landing charges" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.view_details]" link with "View details" text is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5224 |
          | legacy MBB   | QANOV-5225 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5225
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136901 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the late landing charges details from the Messages extra charges screen
    Given user has a "<account_type>" account type
      And user has "late_landing_charges" type of "messages" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Messages Extra Charges" page
     When clicks on the "[CONTEXT:extra_charges_event_list.element.view_details]" link
     Then the "Late Landing Charges" page is displayed
      And the "Late landing charges" header is displayed
      And the "what_are" textfield with "What are the late landing charges?" text is displayed
      And the "description" textfield is displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5226 |
          | legacy MBB   | QANOV-5227 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5223
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136700 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the premium messages in the Messages extra charges screen
    internal_checkpoint="Use the MW API to find users with Premium messages:
    {{O2_API_BASE_URL}}/{{MSISDN}}/postpay/bill/recentcharges/premiumAndInfoServices/charges?filteringmsisdn={{MSISDN}}
    this call will return the premium messages.
    CERT0: PAYM user stester11f220477c-76a5-4101-9664-6b2da5bcfe04@gmail.com"
    Given user has a "<account_type>" account type
      And user has "premium messages" type of "messages" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Messages Extra Charges" page
     Then the "[CONTEXT:extra_charges_event_list.element.star_icon]" icon is displayed
      And the "[CONTEXT:extra_charges_event_list.element.number]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.cost]" textfield with the "£X.XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.time_stamp]" textfield with the "XX:XX" format is displayed
      And the "[CONTEXT:extra_charges_event_list.element.message_type]" textfield containing "Premium services" text is displayed
      And the "[CONTEXT:extra_charges_event_list.element.premium_description]" textfield is displayed
      And the "[CONTEXT:extra_charges_event_list.element.view_details]" link with "View details" text is displayed

    Examples:
          | account_type | automation              | impeded_label | jira_id    |
          | legacy PAYM  |                         |               | QANOV-5228 |
          | legacy MBB   | automation.pending_mock | impeded_mock  | QANOV-5229 |

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5229
  @jira.link.detects.O2UK-3415 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136701 @manual @mobile
  @o2uk @regression
  Scenario Outline: A <account_type> user can see the details of a premium message from the Messages extra charges screen
    CERT0: stester11f220477c-76a5-4101-9664-6b2da5bcfe04@gmail.com (PAYM)
    Given user has a "<account_type>" account type
      And user has "premium messages" type of "messages" extra charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Messages Extra Charges" page
     When clicks on the "[CONTEXT:extra_charges_event_list.element.view_details]" link
     Then the browser webview is displayed
      And the "Premium Service Checker | Account and billing | Help & Support" header is displayed

    Examples:
          | account_type | automation              | impeded_label | jira_id    |
          | legacy PAYM  |                         |               | QANOV-5230 |
          | legacy MBB   | automation.pending_mock | impeded_mock  | QANOV-5231 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136697 @live @mobile @next @o2uk @smoke @webapp
  Scenario Outline: A <account_type> user without "Messages" extra charges can access to the Messages extra charges screen
    commented_tags="@depends_on.NOV-136695"
    other_affected_versions="2021-46"
    Given user has a "<account_type>" account type
      And user has "none" events in the "messages" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_usage.extra_charges" element is visible
      And clicks on the "messages_usage.extra_charges" entrypoint
     Then the "Messages Extra Charges" page is displayed
      And the "extra_charges_title.expiration_date" textfield with the "[Your bill closes in \d+ days|Your billing cycle ended (\d+,\d{3}|\d+) days ago]" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with "£0.00" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "extra_charges_graph" graph is not displayed
      And the "extra_charges_list.empty_case.icon" icon is displayed
      And the "extra_charges_list.empty_case.title" textfield is displayed
      And the "extra_charges_list.empty_case.description" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consumption" page is displayed
      And the "messages" tab is selected

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5232 |
          | legacy MBB   | QANOV-5233 |

  @jira.QANOV-5236 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140 @mobile
  @o2uk @smoke
  Scenario: An AO2 postpay user can access to the Messages extra charges webview from the Messages consumption screen
    Given user has a "AO2 postpay" account type
      And user has a "mobile_line" product
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And clicks on the "messages_usage.extra_charges.value" entrypoint
     Then the internal webview with "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Consumption" page is displayed
      And the "messages" tab is selected

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.<relates_to> @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user with only late landing charges of <allowance_type> won't see the graph in the extra charges screen
    Given user has a "<account_type>" account type
      And user has only "late_landing_charges" type of "<allowance_type>" recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-<allowance_page>" page for the "mobile" product
      And user has the "extra-charges-total" module configured in CMS for "extra-charges-<allowance_page>" page for the "mobile" product
      And user has the "extra-charges-aggregated" module configured in CMS for "extra-charges-<allowance_page>" page for the "mobile" product
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-<allowance_page>" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "<allowance_type>" tab
      And clicks on the "<extra_charges_entrypoint>" entrypoint
     Then the "<extra_charges_page>" page is displayed
      And the "<extra_charges_page_header>" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Your bill closes in DD days" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "DD Mmm - DD Mmm" format is displayed
      And the "extra_charges_title.title" textfield with "You have an extra charge of:" text is displayed
      And the "extra_charges_title.amount" textfield with the "£X.XX" format is displayed
      And the "extra_charges_graph" graph is not displayed
      And the "extra_charges_event_list" list is displayed

    Examples:
          | relates_to | account_type   | allowance_type | allowance_page | extra_charges_entrypoint     | extra_charges_page     | extra_charges_page_header | depends_on | jira_id    |
          | NOV-148966 | legacy postpay | data           | data           | data_usage.extra_charges     | Data Extra Charges     | Data extra charges        | QANOV-5205 | QANOV-5240 |
          | NOV-148971 | legacy PAYM    | minutes        | calls          | minutes_usage.extra_charges  | Minutes Extra Charges  | Minutes extra charges     | QANOV-5213 | QANOV-5241 |
          | NOV-148974 | legacy PAYM    | messages       | messages       | messages_usage.extra_charges | Messages Extra Charges | Messages extra charges    | QANOV-5223 | QANOV-5242 |
          | NOV-148974 | legacy MBB     | messages       | messages       | messages_usage.extra_charges | Messages Extra Charges | Messages extra charges    | QANOV-5223 | QANOV-5243 |

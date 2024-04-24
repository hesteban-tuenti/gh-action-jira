# -*- coding: utf-8 -*-
@jira.QANOV-126821
Feature: Previous Usage


  @jira.QANOV-5118 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136659 @live @mobile @next @o2uk @qa @smoke @webapp
  Scenario: A legacy postpay user with data previous usage in the last 6 months sees the previous usage entry in the Data consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has "data" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "Data previous usage" entrypoint configured in CMS for the "data-consumptions-services" list
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data_previous_usage" module is displayed
      And the "data_previous_usage.title" textfield with "Previous Usage" text is displayed
      And the "data_previous_usage.calendar" icon is displayed
      And the "data_previous_usage.text" entrypoint with "Data previous usage" text is displayed
      And the "data_previous_usage.chevron" icon is displayed

  @jira.QANOV-5119 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-148967 @mobile @o2uk @regression @webapp
  Scenario: A legacy postpay user without data previous usage won't see the previous usage entry in the Data consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And user does not have "data" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data_previous_usage" module is not displayed

  @jira.QANOV-5120 @android @automatic @ber @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5118
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136664 @mobile @o2uk @qa @regression @webapp
  Scenario: A legacy user can access to the Data previous usage screen
    internal_checkpoint="An alert to save money can be shown only if applies. It's validated in another test case"
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has "data" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "Data previous usage" entrypoint configured in CMS for the "data-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_previous_usage.text" entrypoint
     Then the "Previous Usage" page is displayed
      And the "Previous Usage" header is displayed
      And waits until the "previous_usage_graph" element is visible
      And the billing period is displayed in the "x" axis of the "previous_usage_graph" graph
      And the consumptions are displayed in the "y" axis of the "previous_usage_graph" graph
      And the selected month line is displayed in the "last" month of the "previous_usage_graph" graph
      And the "average_label" textfield with "Average usage in period" text is displayed
      And the "average_value" textfield with the "(\d+|\d+.\d\d) (KB|MB|GB)" format is displayed
      And each element in the "events_list" list has the "date" textfield with the "\w{3} \d{4}" format
      And each element in the "events_list" list has the "consumed" textfield with the "(\d+|\d+.\d\d) (KB|MB|GB)" format
      And the "events_list" list has "<7" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Consumption" page is displayed

  @jira.<jira_id> @<ber> @<execution_mode> @android @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @live @mobile @next @o2uk @qa @smoke @<webapp>
  Scenario Outline: An <account_type> user can see the <allowance_type> previous usage entrypoint
    Given user has a "<account_type>" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-<allowance_page>" page for the "mobile" product
      And user has the "<entry_title>" entrypoint configured in CMS for the "<allowance_page>-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "<allowance_type>" tab
     Then the "<allowance_type>_previous_usage" module is displayed
      And the "<allowance_type>_previous_usage.title" textfield with "PREVIOUS USAGE" text is displayed
      And the "<allowance_type>_previous_usage.calendar" icon is displayed
      And the "<allowance_type>_previous_usage.text" entrypoint with "<entry_title>" text is displayed
      And the "<allowance_type>_previous_usage.chevron" icon is displayed

    Examples:
          | account_type | allowance_type | allowance_page | entry_title             | ber | execution_mode | jira_id      | webapp |
          | AO2 postpay  | data           | data           | Data previous usage     | ber | automatic      | QANOV-128889 | webapp |
          | AO2 PAYM     | minutes        | calls          | Minutes previous usage  |     | manual         | QANOV-128890 |        |
          | AO2 PAYM     | messages       | messages       | Messages previous usage |     | manual         | QANOV-128891 |        |
          | AO2 MBB      | messages       | messages       | Messages previous usage |     | manual         | QANOV-128892 |        |

  @jira.QANOV-5121 @android @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5118 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-136664 @manual @mobile @o2uk @regression
  Scenario: An AO2 user can access to the Data previous usage screen
    Given user has a "AO2 postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "Data previous usage" entrypoint configured in CMS for the "data-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_previous_usage.text" entrypoint
     Then the browser webview is displayed
      And the "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Consumption" page is displayed

  @jira.QANOV-5101 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136686 @live @mobile @netcracker @next @o2uk @qa @sanity @webapp
  Scenario: A legacy PAYM user with minutes previous usage in the last 6 months sees the Previous usage entry in the Minutes consumption details
    internal_checkpoint="Table postpay_historicusage in database.
    CERT0: inl_may8842@o2.com"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has "minutes" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "Minutes previous usage" entrypoint configured in CMS for the "calls-consumptions-services" list
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
     Then the "minutes_previous_usage" module is displayed
      And the "minutes_previous_usage.title" textfield with "Previous Usage" text is displayed
      And the "minutes_previous_usage.calendar" icon is displayed
      And the "minutes_previous_usage.text" entrypoint with "Minutes previous usage" text is displayed
      And the "minutes_previous_usage.chevron" icon is displayed

  @jira.QANOV-5127 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-148973 @mobile @netcracker @o2uk @regression @webapp
  Scenario: A legacy PAYM user without minutes previous usage won't see the previous usage entry in the Minutes consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy PAYM" account type
      And user has "minutes" allowances in the "mobile_line" product
      And user does not have "minutes" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "minutes" tab
     Then the "minutes_previous_usage" module is not displayed

  @jira.QANOV-5128 @android @automatic @ber @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5101
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136687 @mobile @o2uk @qa @smoke @webapp
  Scenario: A legacy user with consumptions in at least one month of the last 6 can access to the Minutes previous usage screen
    internal_checkpoint="An alert with recommendations can be optionally displayed. It's validated in another test case"
    Given user has a "legacy PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has "minutes" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "Minutes previous usage" entrypoint configured in CMS for the "calls-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
      And clicks on the "minutes_previous_usage.text" entrypoint
     Then the "Previous Usage" page is displayed
      And the "Previous Usage" header is displayed
      And waits until the "previous_usage_graph" element is visible
      And the billing period is displayed in the "x" axis of the "previous_usage_graph" graph
      And the consumptions are displayed in the "y" axis of the "previous_usage_graph" graph
      And the selected month line is displayed in the "last" month of the "previous_usage_graph" graph
      And the "average_label" textfield with "Average usage in period" text is displayed
      And the "average_value" textfield with the "\d+:\d\d Mins" format is displayed
      And each element in the "events_list" list has the "date" textfield with the "\w{3} \d{4}" format
      And each element in the "events_list" list has the "consumed" textfield with the "\d+:\d\d Mins" format
      And the "events_list" list has "<7" elements
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Consumption" page is displayed
      And the "minutes" tab is selected

  @jira.QANOV-5129 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5101
  @jira.link.detects.OBO2UK-1439 @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-136687 @mobile @o2uk
  @smoke
  Scenario: An AO2 user can access to the Minutes previous usage screen
    Given user has a "AO2 PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "Minutes previous usage" entrypoint configured in CMS for the "calls-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And clicks on the "minutes_previous_usage.text" entrypoint
     Then the internal webview with "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Consumption" page is displayed

  @jira.QANOV-5145 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136702 @live @mobile @netcracker @next @o2uk @qa @smoke @webapp
  Scenario: A legacy user with messages previous usage in the last 6 months sees the Previous usage entry in the Messages consumption details
    internal_checkpoint="Table postpay_historicusage in database.
    CERT0: 25ap80574196@stf.ref.o2.co.uk"
    commented_tags="@depends_on.NOV-101231"
    Given user has any "legacy PAYM;legacy MBB" account types
      And user has any allowance in the "mobile_line" product
      And user has "messages" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "Messages previous usage" entrypoint configured in CMS for the "messages-consumptions-services" list
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "messages" tab
      And waits until the "messages_previous_usage" element is visible
     Then the "messages_previous_usage" module is displayed
      And the "messages_previous_usage.title" textfield with "Previous Usage" text is displayed
      And the "messages_previous_usage.calendar" icon is displayed
      And the "messages_previous_usage.text" entrypoint with "Messages previous usage" text is displayed
      And the "messages_previous_usage.chevron" icon is displayed

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-148975 @mobile @netcracker @o2uk @regression @webapp
  Scenario Outline: A <account_type> user without messages previous usage won't see the previous usage entry in the Messages consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "<account_type>" account type
      And user has "messages" allowances in the "mobile_line" product
      And user does not have "messages" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "messages" tab
     Then the "messages_previous_usage" module is not displayed

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5147 |
          | legacy MBB   | QANOV-5148 |

  @jira.QANOV-5149 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5146 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136703 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user with consumption in at least one month of the last 6 can access to the Messages previous usage screen
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has "messages" previous usage in the mobile line product from 6 months ago
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "Messages previous usage" entrypoint configured in CMS for the "messages-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And clicks on the "messages_previous_usage.text" entrypoint
     Then the "Previous Usage" page is displayed
      And the "Previous Usage" header is displayed
      And waits until the "previous_usage_graph" element is visible
      And the billing period is displayed in the "x" axis of the "previous_usage_graph" graph
      And the consumptions are displayed in the "y" axis of the "previous_usage_graph" graph
      And the selected month line is displayed in the "last" month of the "previous_usage_graph" graph
      And the "average_label" textfield with "Average usage in period" text is displayed
      And the "average_value" textfield with the "\d+ SMS" format is displayed
      And each element in the "events_list" list has the "date" textfield with the "\w{3} \d{4}" format
      And each element in the "events_list" list has the "consumed" textfield with the "\d+ SMS" format
      And the "events_list" list has "<7" elements
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consumption" page is displayed
      And the "messages" tab is selected

  @jira.QANOV-5151 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5146
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-136703 @mobile @o2uk @regression
  Scenario: An AO2 postpay user can access to the Messages previous usage screen
    Given user has a "AO2 postpay" account type
      And user has a "mobile_line" product
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user has the "Messages previous usage" entrypoint configured in CMS for the "messages-consumptions-services" list
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And clicks on the "messages_previous_usage.text" entrypoint
     Then the internal webview with "Account | My O2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Consumption" page is displayed

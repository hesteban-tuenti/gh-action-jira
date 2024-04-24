# -*- coding: utf-8 -*-
@jira.QANOV-5090
Feature: Consumption

  Actions After the Feature:
     Then navigates to "Account" page

  @jira.QANOV-5091 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.detects.OBO2UK-1231
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-136654 @mobile
  @o2uk @qa @sanity @webapp
  Scenario: A legacy user can access the data consumption details from data roundel
    internal_checkpoint="Formats:
    - billing cycle: Your bill closes in XX days
    - billing period: DD Mmm - DD Mmm
    CERT0: testevidences@gmail.com (07545049599)
    Optional modules verified in other scenarios:
    - Data Allowance and Bolt Ons section (only if the user has data bolt ons)
    - Previous usage link (only if the user has data previous usage)
    - Data Sharing section (only if the user has Data sharing)"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy postpay" account type
      And user has bills
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended \d+(?:,\d+)* days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "info_icon" icon is displayed
      And the "data_usage.consumption" module is displayed
      And the "data_usage.extra_charges" module is displayed

  @jira.QANOV-5092 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.detects.OBO2UK-1231
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-136654 @mobile
  @next @o2uk @qa @sanity @live @webapp
  Scenario: An AO2 user can access the data consumption details from data roundel
    internal_checkpoint="CERT0: testevidences@gmail.com (07545049599)
    Optional modules verified in other scenarios:
    - Data Allowance and Bolt Ons section (only if the user has data bolt ons)
    - Previous usage link (only if the user has data previous usage)"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "AO2 postpay" account type
      And user has bills
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended \d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "info_icon" icon is displayed
      And the "data_usage.consumption" module is displayed
      And the "data_usage.extra_charges" module is displayed

  @jira.QANOV-5093 @android @automatic @ber @ios @jira.cv.11.5 @jira.link.relates_to.NOV-136722 @mobile @netcracker
  @o2uk @qa @smoke @webapp
  Scenario: A companion device user won't see the allowance tabs
    commented_tags="@depends_on.NOV-101231"
    Given user has a "companion" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "data" tab is not displayed
      And the "minutes" tab is not displayed
      And the "messages" tab is not displayed

  @jira.QANOV-5094 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5091
  @jira.link.depends_on.QANOV-5093 @jira.link.depends_on.QANOV-5109 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136655 @mobile @next @o2uk @smoke @live @webapp
  Scenario: A legacy user without extra data charges sees the consumption and extra charges module
    Given user has a "legacy postpay" account type
      And user has "none" events in the "data" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
     Then the "data_usage.title" textfield with "YOUR TOTAL DATA USAGE SO FAR" text is displayed
      And the "data_usage.consumption.title" textfield with "You have used" text is displayed
      And the "data_usage.consumption.value" textfield with the "\d+ (MB|GB)" format is displayed
      And the "data_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "data_usage.extra_charges.value" textfield with "£0.00" text is displayed

  @jira.QANOV-5095 @android @automatic @ber @qa @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5092
  @jira.link.depends_on.QANOV-5093 @jira.link.depends_on.QANOV-5109 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-136655 @mobile @next @o2uk @smoke @live @webapp
  Scenario: An AO2 user without extra data charges sees the consumption and extra charges module
    Given user has a "AO2 postpay" account type
      And user has "none" events in the "data" category of recent charges
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
     Then the "data_usage.title" textfield with "YOUR TOTAL DATA USAGE SO FAR" text is displayed
      And the "data_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "data_usage.extra_charges.value" textfield with "£0.00" text is displayed

  @jira.QANOV-5097 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5091
  @jira.link.depends_on.QANOV-5093 @jira.link.depends_on.QANOV-5109 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-164061 @mobile @next @o2uk @smoke @live @webapp
  Scenario: A legacy user without data consumption access the data consumption details screen
    Given user has a "legacy postpay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has not made consumption on the "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data_usage.title" textfield with "YOUR TOTAL DATA USAGE SO FAR" text is displayed
      And the "data_usage.consumption.title" textfield with "You have used" text is displayed
      And the "data_usage.consumption.value" textfield with "0 MB" text is displayed
      And the "data_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "data_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed

  @jira.QANOV-5098 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136676 @mobile @o2uk @sanity @webapp
  Scenario: A legacy postpay user can access the minutes consumption details from minutes roundel
    internal_checkpoint="NOTE: the screen could contain the following sections depending of the user:
    - Minutes Allowance and Bolt Ons section (only if the user has minutes bolt ons)
    - Previous usage link (only if the user has minutes previous usage)
    - If the billing cycle expired before, the format should be Your billing cycle ended X days ago"
    commented_tags="@depends_on.NOV-NOV-101231"
    Given user has a "legacy PAYM" account type
      And user has bills
      And user has "minutes" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended (\d+,)?\d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "minutes" tab is selected
      And the "minutes" textfield with "[LANG:account.event_history_aggregated.allowances.minutes]" text is displayed
      And the "data" tab is displayed
      And the "messages" tab is displayed
      And the "info_icon" icon is displayed
      And the "minutes_usage.consumption" module is displayed
      And the "minutes_usage.extra_charges" module is displayed

  @jira.QANOV-5099 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-136676 @mobile @next @o2uk @sanity @live @qa @webapp
  Scenario: An AO2 postpay user can access the minutes consumption details from minutes roundel
    internal_checkpoint="NOTE: the screen could contain the following sections depending of the user:
    - Minutes Allowance and Bolt Ons section (only if the user has minutes bolt ons)
    - Previous usage link (only if the user has minutes previous usage)
    - If the billing cycle expired before, the format should be Your billing cycle ended X days ago"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "AO2 PAYM" account type
      And user has bills
      And user has "minutes" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended \d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "minutes" tab is selected
      And the "minutes" textfield with "[LANG:account.event_history_aggregated.allowances.minutes]" text is displayed
      And the "data" tab is displayed
      And the "messages" tab is displayed
      And the "info_icon" icon is displayed
      And the "minutes_usage.consumption" module is displayed
      And the "minutes_usage.extra_charges" module is displayed

  @jira.QANOV-5100 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5098
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-164063 @mobile @next @o2uk @smoke @webapp
  Scenario: A legacy user without minutes consumptions access the minutes consumption details screen
    Given user has a "legacy PAYM" account type
      And user has not made consumption on the "minutes" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
     Then the "minutes_usage.title" textfield with "YOUR TOTAL MINUTES USAGE SO FAR" text is displayed
      And the "minutes_usage.consumption.title" textfield with "You have used" text is displayed
      And the "minutes_usage.consumption.value" textfield with "0min" text is displayed
      And the "minutes_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "minutes_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed

  @jira.<jira_id> @<test_priority> @android @automatic @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136694 @mobile @o2uk @webapp
  Scenario Outline: A <account_type> user can access the messages consumption details from messages roundel
    internal_checkpoint="NOTE: the screen could contain the following sections depending of the user:
    - Messages Allowance and Bolt Ons section (only if the user has messages bolt ons)
    - Previous usage link (only if the user has messages previous usage)
    - If the billing cycle expired before, the format should be Your billing cycle ended X days ago
    CERT0: testevidences@gmail.com (07545049599)"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "<account_type>" account type
      And user has bills
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended (\d,)?\d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "messages" tab is selected
      And the "messages" textfield is displayed
      And the "info_icon" icon is displayed
      And the "messages_usage.consumption" module is displayed
      And the "messages_usage.extra_charges" module is displayed

    @cert0 @cert1
    Examples:
          | account_type | test_priority | jira_id    |
          | legacy PAYM  | sanity        | QANOV-5102 |

    @ber @qa @webapp
    Examples:
          | account_type | test_priority | jira_id    |
          | legacy MBB   | regression    | QANOV-5103 |

  @jira.<jira_id> @<ber> @<execution_mode> @<test_priority> @android @cert0 @cert1 @ios @jira.cv.12.4
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-136694 @mobile @next @o2uk @live @qa @<webapp>
  Scenario Outline: An <account_type> user can access the messages consumption details from messages roundel
    internal_checkpoint="NOTE: the screen could contain the following sections depending of the user:
    - Messages Allowance and Bolt Ons section (only if the user has messages bolt ons)
    - Previous usage link (only if the user has messages previous usage)
    - If the billing cycle expired before, the format should be Your billing cycle ended X days ago
    CERT0: testevidences@gmail.com (07545049599)"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "<account_type>" account type
      And user has bills
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended \d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "messages" tab is selected
      And the "messages" textfield with "[LANG:account.event_history_aggregated.allowances.sms]" text is displayed
      And the "info_icon" icon is displayed
      And the "messages_usage.consumption" module is displayed
      And the "messages_usage.extra_charges" module is displayed

    Examples:
          | account_type | ber | webapp | test_priority | execution_mode | jira_id    |
          | AO2 PAYM     | ber | webapp | sanity        | automatic      | QANOV-5104 |
          | AO2 MBB      |     |        | regression    | manual         | QANOV-5106 |

  @jira.<jira_id> @<ber> @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5103
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-164065 @mobile @next @o2uk @smoke @live @webapp
  Scenario Outline: A <account_type> user without messages consumptions access the messages consumption details screen
    Given user has a "<account_type>" account type
      And user has not made consumption on the "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_usage" element is visible
     Then the "messages_usage.title" textfield with "YOUR TOTAL MESSAGES USAGE SO FAR" text is displayed
      And the "messages_usage.consumption.title" textfield with "You have used" text is displayed
      And the "messages_usage.consumption.value" textfield with "0 SMS" text is displayed
      And the "messages_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "messages_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed

    Examples:
          | account_type | ber | jira_id    |
          | legacy PAYM  |     | QANOV-5107 |
          | legacy MBB   | ber | QANOV-5108 |

  @jira.QANOV-5109 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.relates_to.NOV-136721 @mobile @netcracker
  @next @o2uk @smoke @webapp @ao2_api_issues
  Scenario: Mobile Broadband user will only see the specific allowance tabs
    commented_tags="@depends_on.NOV-101231"
    NOTE: setted to legacy until ao2 APIS works fine again
    Given user has a "legacy MBB" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "data" tab is displayed
      And the "minutes" tab is not displayed
      And the "messages" tab is displayed

  @jira.QANOV-5111 @android @automatic @ios @jira.cv.11.5 @jira.link.relates_to.NOV-148965 @mobile @netcracker @o2uk @qa
  @smoke @webapp
  Scenario: Postpay user with only one type of allowance will see all the allowance tabs
    commented_tags="@depends_on.NOV-101231"
    Given user has a "PAYM" account type
      And user has one allowance in the mobile line product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "data" tab is displayed
      And the "minutes" tab is displayed
      And the "messages" tab is displayed

  @jira.QANOV-5112 @android @automatic @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136656 @mobile @o2uk @qa @smoke @webapp
  Scenario: A legacy user with extra data charges sees the consumption and extra charges module
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has "charged" events in the "data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data_usage.title" textfield with "YOUR TOTAL DATA USAGE SO FAR" text is displayed
      And the "data_usage.consumption.title" textfield with "You have used" text is displayed
      And the "data_usage.consumption.value" textfield with the "\d+(.\d+)? (MB|GB)" format is displayed
      And the "data_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "data_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed
      And the "data_usage.extra_charges.value" textfield is displayed in "red" color

  @jira.QANOV-5113 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-136656 @mobile @next @o2uk @smoke
  Scenario: An AO2 user with extra data charges sees the extra charges module
    CERT0: ncqae2etest+343324943@gmail.com
    commented_tags="@depends_on.NOV-101231"
    Given user has a "AO2 postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has "charged" events in the "data" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data_usage.title" textfield with "YOUR TOTAL DATA USAGE SO FAR" text is displayed
      And the "data_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "data_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed
      And the "data_usage.extra_charges.value" textfield is displayed in "red" color

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5091 @jira.link.depends_on.QANOV-5093
  @jira.link.depends_on.QANOV-5109 @jira.link.relates_to.NOV-136660 @manual @mobile @netcracker @o2uk @regression
  Scenario Outline: A <account_type> user with only ONE data bundle accesses the data consumption details screen
    Given user has a "<account_type>" account type
      And user "1" data bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
     Then the "data_allowances.title" textfield is not displayed

    Examples:
          | account_type | jira_id    |
          | PAYM         | QANOV-5115 |
          | MBB          | QANOV-5116 |

  @jira.QANOV-5117 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5091 @jira.link.depends_on.QANOV-5093
  @jira.link.depends_on.QANOV-5109 @jira.link.relates_to.NOV-136661 @manual @mobile @netcracker @o2uk @regression
  Scenario: User with more than two data bundle accesses the data consumption details screen
    internal_checkpoint="To find a user with more than two data bundles check the apic response
    '/\{msisdn}/postpay/allowance/data' and make sure that the field 'allowance_details' returns more than one
    allowances like the following:
    {code:java}
    'allowance_details': [
    {
    'starting_allowance_message': 'Unlimited Data allowance',
    'bundle_type': 'CORE',
    'expiry_date': '04.12.2019'
    },
    {
    'starting_allowance_message': 'Unlimited Data allowance',
    'bundle_type': 'CORE',
    'expiry_date': '04.12.2019'
    },
    {
    'starting_allowance_message': 'Unlimited Data allowance',
    'bundle_type': 'CORE',
    'expiry_date': '04.12.2019'
    }
    ]{code}
    CERT0: amaia@tuenti.com (2021/07/07)"
    Given user has a "postpay" account type
      And user ">2" data bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data_allowances.title" textfield with "Your Data Allowance and Bolt Ons" text is displayed
      And the "data_allowances.bundles" list is displayed collapsed
      And the "data_allowances.view_more_link" link is displayed

  @jira.QANOV-5122 @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5098
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136677 @mobile @next @o2uk @smoke @webapp
  Scenario: A legacy user without extra minutes charges sees the consumption and extra charges module
    Given user has a "legacy PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has "none" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
     Then the "minutes_usage.title" textfield with "YOUR TOTAL MINUTES USAGE SO FAR" text is displayed
      And the "minutes_usage.consumption.title" textfield with "You have used" text is displayed
      And the "minutes_usage.consumption.value" textfield with the "^(\d+h)?\s?(\d+min)?\s?(\d+s)?$" format is displayed
      And the "minutes_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "minutes_usage.extra_charges.value" textfield with "£0.00" text is displayed
      And the "minutes_usage.extra_charges.value" textfield is displayed in "black" color

  @jira.QANOV-5124 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5099
  @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-136677 @mobile @next @o2uk @smoke @webapp
  Scenario: An AO2 user without extra minutes charges sees the extra charges module
    Given user has a "AO2 PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has "none" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
     Then the "minutes_usage.title" textfield with "YOUR TOTAL MINUTES USAGE SO FAR" text is displayed
      And the "minutes_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "minutes_usage.extra_charges.value" textfield with "£0.00" text is displayed
      And the "minutes_usage.extra_charges.value" textfield is displayed in "black" color

  @jira.QANOV-5125 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5098 @jira.link.relates_to.NOV-136882 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: User with only ONE minutes bundle accesses the minutes consumption details screen
    Given user has a "PAYM" account type
      And user has "1" minutes bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes_allowances.title" textfield is not displayed

  @jira.QANOV-5126 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5098
  @jira.link.relates_to.NOV-136883 @manual @mobile @netcracker @o2uk @regression
  Scenario: User with more than two minutes bundles accesses the minutes consumption details screen
    Given user has a "PAYM" account type
      And user has ">2" minutes bundle active
      And user has the matching subscription selected in the account
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
     Then the "minutes_allowances.title" textfield with "Your Minutes Allowance and Bolt Ons" text is displayed
      And the "minutes_allowances.bundles" list is displayed collapsed
      And the "minutes_allowances.view_more_link" link is displayed

  @jira.QANOV-5130 @android @automatic @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136723 @mobile @o2uk @qa @sanity @webapp
  Scenario: A legacy Mobile Broadband user can access the message consumption details from message roundel
    internal_checkpoint="Optional modules verified in other scenarios:
    - Message Allowance and Bolt Ons section (only if the user has message bolt ons)
    - Previous usage link (only if the user has messages previous usage)"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy MBB" account type
      And user has bills
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended \d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "data" tab is displayed
      And the "minutes" tab is not displayed
      And the "messages" tab is selected
      And the "messages" textfield with "[LANG:account.event_history_aggregated.allowances.sms]" text is displayed
      And the "messages_usage.consumption" module is displayed
      And the "messages_usage.extra_charges" module is displayed

  @jira.QANOV-5132 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-136723 @mobile @next @o2uk @sanity @qa @webapp
  Scenario: An AO2 Mobile Broadband user can access the message consumption details from message roundel
    internal_checkpoint="Optional modules verified in other scenarios:
    - Message Allowance and Bolt Ons section (only if the user has message bolt ons)
    - Previous usage link (only if the user has messages previous usage)"
    commented_tags="@depends_on.NOV-101231"
    Given user has a "AO2 MBB" account type
      And user has bills
      And user has "messages" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "billing-cycle-header" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "messages_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Usage" header is displayed
      And the "billing_cycle_end_time" textfield with the "(Your bill closes in \d+ days)|(Your billing cycle ended \d+ days ago)|(Your billing cycle ends today)" format is displayed
      And the "billing_period" textfield with the "^([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) - ([1-9]|[12]\d|3[01]) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)$" format is displayed
      And the "data" tab is displayed
      And the "minutes" tab is not displayed
      And the "messages" tab is selected
      And the "messages" textfield with "[LANG:account.event_history_aggregated.allowances.sms]" text is displayed
      And the "messages_usage.consumption" module is displayed
      And the "messages_usage.extra_charges" module is displayed

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5103
  @jira.link.depends_on.QANOV-5130 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136695 @mobile @next
  @o2uk @smoke @webapp
  Scenario Outline: A <account_type> user without extra messages charges sees the consumption and extra charges module
    Given user has a "<account_type>" account type
      And user has any allowance in the "mobile_line" product
      And user has "none" events in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_usage" element is visible
     Then the "messages_usage.title" textfield with "YOUR TOTAL MESSAGES USAGE SO FAR" text is displayed
      And the "messages_usage.consumption.title" textfield with "You have used" text is displayed
      And the "messages_usage.consumption.value" textfield with the "\d+ SMS" format is displayed
      And the "messages_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "messages_usage.extra_charges.value" textfield with "£0.00" text is displayed
      And the "messages_usage.extra_charges.value" textfield is displayed in "black" color

    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5133 |
          | legacy MBB   | QANOV-5134 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5106
  @jira.link.depends_on.QANOV-5132 @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-136695 @mobile @next
  @o2uk @smoke @webapp @qa
  Scenario Outline: An <account_type> user without extra messages charges sees the extra charges module
    Given user has a "<account_type>" account type
      And user has any allowance in the "mobile_line" product
      And user has "none" events in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_usage" element is visible
     Then the "messages_usage.title" textfield with "YOUR TOTAL MESSAGES USAGE SO FAR" text is displayed
      And the "messages_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "messages_usage.extra_charges.value" textfield with "£0.00" text is displayed
      And the "messages_usage.extra_charges.value" textfield is displayed in "black" color

    Examples:
          | account_type | jira_id    |
          | AO2 PAYM     | QANOV-5135 |
          | AO2 MBB      | QANOV-5136 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5103 @jira.link.depends_on.QANOV-5130
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136696 @mobile @o2uk @smoke @webapp
  Scenario Outline: A <account_type> user with extra messages charges sees the consumption and extra charges module
    Given user has a "<account_type>" account type
      And user has any allowance in the "mobile_line" product
      And user has "charged" events in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_usage" element is visible
     Then the "messages_usage.title" textfield with "YOUR TOTAL MESSAGES USAGE SO FAR" text is displayed
      And the "messages_usage.consumption.title" textfield with "You have used" text is displayed
      And the "messages_usage.consumption.value" textfield with the "^\d+ SMS$" format is displayed
      And the "messages_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "messages_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed
      And the "messages_usage.extra_charges.value" textfield is displayed in "red" color

    @cert0 @cert1 @next @qa
    Examples:
          | account_type | jira_id    |
          | legacy PAYM  | QANOV-5137 |

    @qa
    Examples:
          | account_type | jira_id    |
          | legacy MBB   | QANOV-5138 |

  @jira.QANOV-5139 @ber @android @automatic @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-5106
  @jira.link.depends_on.QANOV-5132 @jira.link.parent_test_plan.QANOV-24140 @jira.link.relates_to.NOV-136696 @mobile @o2uk
  @smoke @qa @cert0 @cert1 @next @webapp
  Scenario: An AO2 user with extra messages charges sees the extra charges module
    CERT0: pohal32053@heroulo.com
    Given user has any "AO2 PAYM;AO2 MBB" account types
      And user has any allowance in the "mobile_line" product
      And user has "charged" events in the "messages" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And waits until the "messages_usage" element is visible
     Then the "messages_usage.title" textfield with "YOUR TOTAL MESSAGES USAGE SO FAR" text is displayed
      And the "messages_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "messages_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed
      And the "messages_usage.extra_charges.value" textfield is displayed in "red" color

  @jira.<jira_id> @<automation> @<impeded_label> @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5103
  @jira.link.depends_on.QANOV-5130 @jira.link.relates_to.NOV-136886 @manual @mobile @netcracker @o2uk @regression
  Scenario Outline: A <account_type> user with only ONE messages bundle accesses the messages consumption details screen
    Given user has a "<account_type>" account type
      And user has "1" message bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
     Then the "messages_allowances.title" textfield is not displayed

    Examples:
          | account_type | impeded_label | automation              | jira_id    |
          | PAYM         |               |                         | QANOV-5141 |
          | MBB          | impeded_mock  | automation.pending_mock | QANOV-5142 |

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5091 @jira.link.depends_on.QANOV-5093
  @jira.link.depends_on.QANOV-5109 @jira.link.relates_to.NOV-136887 @manual @mobile @netcracker @o2uk @regression
  Scenario Outline: A <account_type> user with more than two messages bundles accesses the messages consumption details screen
    Given user has a "<account_type>" account type
      And user has ">2" message bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
     Then the "messages_allowances.title" textfield with "Your Messages Allowance and Bolt Ons" text is displayed
      And the "messages_allowances.bundles" list is displayed collapsed
      And the "messages_allowances.view_more_link" link is displayed

    Examples:
          | account_type | jira_id    |
          | PAYM         | QANOV-5143 |
          | MBB          | QANOV-5144 |

  @jira.QANOV-5153 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.9 @jira.link.relates_to.NOV-210064
  @manual @mobile @netcracker @o2uk @regression
  Scenario: User with a billing cycle that starts and ends at the same day will se an Empty case in the Consumption page
    internal_checkpoint="CERT0: testuser32@o2.com"
    other_affected_versions="2021-46"
    Given user has a "postpay" account type
      And user has any allowance in the "mobile_line" product
      And the billing cycle starts and ends the same day
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Your usage will be displayed soon" text is displayed
      And the "empty_case.subtitle" textfield with "The billing cycle is restarting" text is displayed

  @jira.QANOV-5154 @automation.hard @ios @jira.cv.11.9 @jira.link.depends_on.QANOV-5091 @jira.link.relates_to.NOV-155490
  @manual @mobile @o2uk @regression
  Scenario: A user can bounce against the upper side of the screen in Data Consumption screen on iOS devices
    Given user has a "postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And swipes down going beyond the top scroll limit
     Then the page is scrolled down
      And the background shown above the content will match the header color

  @jira.QANOV-5155 @android @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-5091 @jira.link.depends_on.QANOV-5093
  @jira.link.depends_on.QANOV-5109 @jira.link.relates_to.NOV-194596 @manual @mobile @netcracker @o2uk @regression
  Scenario: User can see more info about the consumption for a user without Essential tariff
    internal_checkpoint="The users without Essential tariff will see in the legacy API /currentandpendingtariff a field:
    'isEssentialTariff': 'False'"
    Given user has a "postpay" account type
      And user has any allowance in the "mobile_line" product
      And user does not have a "essential" tariff
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "info_icon" icon
     Then the "More Info Consumption" page is displayed
      And the "Usage" header is displayed
      And the "more_info_title" textfield with "Usage information" text is displayed
      And the "more_info_text" textfield with "UK data will update in 30 mins, Europe Zone may take 24 hours. Mins and texts in UK/Europe Zone usually update within 24 hours, but international calls may take longer." text is displayed

  @jira.QANOV-5156 @android @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-5091 @jira.link.depends_on.QANOV-5093
  @jira.link.depends_on.QANOV-5109 @jira.link.relates_to.NOV-194598 @manual @mobile @netcracker @o2uk @regression
  Scenario: User can see more info about the consumption for a user with Essential tariff
    internal_checkpoint="The users with Essential tariff will see in the legacy API /currentandpendingtariff a field:
    'isEssentialTariff': 'True'
    CERT0 user: myo219864101@stf.ref.o2.co.uk"
    Given user has a "postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has a "essential" tariff
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "info_icon" icon
     Then the "More Info Consumption" page is displayed
      And the "Usage" header is displayed
      And the "more_info_title" textfield with "Usage information" text is displayed
      And the "more_info_text" textfield with "Data will update in 30 mins. Mins and texts usually update within 24 hours." text is displayed

  @jira.QANOV-5157 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5117 @jira.link.relates_to.NOV-136662 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: User with more than two data bundles expands the bundles list in the data consumption details screen
    internal_checkpoint="Each bolton item will include the renewal/expiry date if available
    CERT0: amaia@tuenti.com"
    Given user has a "postpay" account type
      And user has ">2" data bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_allowances.view_more_link" link
     Then the "data_allowances.bundles" list is displayed expanded
      And each element in the "data_allowances.bundles" list has the "data_icon" icon
      And each element in the "data_allowances.bundles" list has the "name" field
      And the "data_allowances.view_less_link" link with "View less" text is displayed

  @jira.QANOV-5159 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136679 @mobile @o2uk @regression @webapp
  Scenario: A legacy user with extra minutes charges sees the extra charges module
    commented_tags="@depends_on.NOV-101231"
    Given user has a "legacy PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has "minutes" recent charges
      And user has "charged" events in the "minutes:international_minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
     Then the "minutes_usage.title" textfield with "YOUR TOTAL MINUTES USAGE SO FAR" text is displayed
      And the "minutes_usage.consumption" module is displayed
      And the "minutes_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "minutes_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed
      And the "minutes_usage.extra_charges.value" textfield is displayed in "red" color

  @jira.QANOV-5160 @android @automatic @cert0 @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140
  @jira.link.relates_to.NOV-136679 @mobile @next @o2uk @smoke @webapp
  Scenario: An AO2 user with extra minutes charges sees the extra charges module
    commented_tags="@depends_on.NOV-101231"
    Given user has a "AO2 PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has "charged" events in the "minutes" category of recent charges
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And waits until the "minutes_usage" element is visible
     Then the "minutes_usage.title" textfield with "YOUR TOTAL MINUTES USAGE SO FAR" text is displayed
      And the "minutes_usage.extra_charges.title" textfield with "Extra charges" text is displayed
      And the "minutes_usage.extra_charges.value" textfield with the "£\d+.\d\d" format is displayed
      And the "minutes_usage.extra_charges.value" textfield is displayed in "red" color

  @jira.QANOV-5161 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5126
  @jira.link.relates_to.NOV-136884 @manual @mobile @netcracker @o2uk @regression
  Scenario: User with more than two minutes bundles expands the bundles list in the minutes consumption details screen
    internal_checkpoint="Each bolton item will include the renewal date if available"
    Given user has a "PAYM" account type
      And user has ">2" minutes bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And clicks on the "minutes_allowances.view_more_link" link
     Then the "minutes_bundles" list is displayed expanded
      And each element in the "minutes_allowances.bundles" list has the "minutes_icon" icon
      And each element in the "minutes_allowances.bundles" list has the "bundle_size" field
      And each element in the "minutes_allowances.bundles" list has the "name" field
      And the "minutes_allowances.view_less.link" link with "View less" text is displayed

  @jira.QANOV-5163 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5144 @jira.link.relates_to.NOV-136888 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: User with more than two messages bundles expands the bundles list in the messages consumption details screen
    internal_checkpoint="Each bolton item will include the renewal date if available"
    Given user has a "postpay" account type
      And user has ">2" message bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And clicks on the "messages_allowances.view_more_link" link
     Then the "sms_bundles" list is displayed expanded
      And each element in the "messages_allowances.bundles" list has the "sms_icon" icon
      And each element in the "messages_allowances.bundles" list has the "bundle_size" field
      And each element in the "messages_allowances.bundles" list has the "name" field
      And the "minutes_allowances.view_less_link" link with "View less" text is displayed

  @jira.QANOV-5166 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-47935 @manual @mobile @o2uk @regression
  Scenario: User can switch among the consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data" tab is selected
      And as user clicks on the allowance tabs, the specific data is displayed
          | allowance | element              | text                             |
          | data      | data_usage.title     | YOUR TOTAL DATA USAGE SO FAR     |
          | minutes   | minutes_usage.title  | YOUR TOTAL MINUTES USAGE SO FAR  |
          | sms       | messages_usage.title | YOUR TOTAL MESSAGES USAGE SO FAR |

  @jira.QANOV-5167 @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-47935 @manual @mobile @o2uk @regression
  Scenario: User can switch among the consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "MBB" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user has the "event-history-total" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data" tab is selected
      And as user clicks on the allowance tabs, the specific data is displayed
          | allowance | element              | text                             |
          | data      | data_usage.title     | YOUR TOTAL DATA USAGE SO FAR     |
          | sms       | messages_usage.title | YOUR TOTAL MESSAGES USAGE SO FAR |

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5166 @jira.link.depends_on.QANOV-5167
  @jira.link.relates_to.NOV-136710 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user goes back to Account dashboard from the Consumption details after switching among the consumption details
    Given user has a "<account_type>" account type
      And user has any allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Consumption" page
     When switches among the consumption details
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Account" page is displayed
      And the "Account" header is displayed

    Examples:
          | account_type | jira_id    |
          | PAYM         | QANOV-5184 |
          | MBB          | QANOV-5185 |

  @jira.QANOV-5186 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5117 @jira.link.relates_to.NOV-136663 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: User with more than two data bundles collapses the bundles list in the data consumption details screen
    Given user has a "postpay" account type
      And user has ">2" data bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-data" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "data" tab
      And clicks on the "data_allowances.view_more_link" link
      And clicks on the "data_allowances.view_less_link" link
     Then the "data_allowances.bundles" list is displayed collapsed
      And the "data_allowances.view_more_link" link with "View more" text is displayed

  @jira.QANOV-5187 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5126
  @jira.link.relates_to.NOV-136885 @manual @mobile @netcracker @o2uk @regression
  Scenario: User with more than two minutes bundles collapses the bundles list in the minutes consumption details screen
    Given user has a "PAYM" account type
      And user has ">2" minutes bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-calls" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "minutes" tab
      And clicks on the "minutes_allowances.view_more_link" link
      And clicks on the "minutes_allowances.view_less_link" link
     Then the "minutes_allowances.bundles" list is displayed collapsed
      And the "minutes_allowances.view_more_link" link with "View more" text is displayed

  @jira.QANOV-5188 @android @ios @jira.cv.11.5 @jira.link.depends_on.QANOV-5144 @jira.link.relates_to.NOV-136889 @manual
  @mobile @netcracker @o2uk @regression
  Scenario: A user with more than two messages bundles collapses the bundles list in the messages consumption details screen
    Given user has any "PAYM;MBB" account types
      And user has ">2" message bundle active
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumptions-messages" page for the "mobile" product
      And user is in the "Consumption" page
     When clicks on the "messages" tab
      And clicks on the "messages_allowances.view_more_link" link
      And clicks on the "messages_allowances.view_less_link" link
     Then the "messages_allowances.bundles" list is displayed collapsed
      And the "messages_allowances.view_more_link" link with "View more" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.relates_to.NOV-136724 @manual @mobile @netcracker @o2uk
  @regression
  Scenario Outline: Postpay user without roundels of <allowance> allowance type will see all allowance tabs in the Consumption details screen
    commented_tags="@depends_on.NOV-101231
    CERT0: no data - inl_may8842@o2.com (07521130461) (2021/07/08)
    no minutes and messages - cpwtest09061054@stf.ref.o2.co.uk (2021/07/08)"
    Given user has a "PAYM" account type
      And user has any allowance in the "mobile_line" product
      And user has no "<allowance>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data" tab is displayed
      And the "minutes" tab is displayed
      And the "messages" tab is displayed

    @automation.pending_mock @impeded_mock
    Examples:
          | allowance | jira_id    |
          | data      | QANOV-5190 |

    Examples:
          | allowance | jira_id    |
          | minutes   | QANOV-5191 |
          | messages  | QANOV-5192 |

  @jira.<jira_id> @<automation> @<execution_mode> @<impeded_label> @android @cert0 @cert1 @ios @jira.cv.11.5
  @jira.link.relates_to.NOV-136725 @mobile @netcracker @o2uk @regression
  Scenario Outline: Mobile Broadband user without roundels of <allowance> allowance type will see all allowance tabs in the Consumption details
    commented_tags="@depends_on.NOV-101231"
    Given user has a "MBB" account type
      And user has any allowance in the "mobile_line" product
      And user has no "<allowance>" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "tabs" module configured in CMS for "consumptions" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "data" tab is displayed
      And the "messages" tab is displayed

    Examples:
          | allowance | execution_mode | impeded_label | automation               | jira_id    |
          | data      | manual         | impeded_mock  | @automation.pending_mock | QANOV-5193 |
          | messages  | automatic      |               |                          | QANOV-5194 |

# -*- coding: utf-8 -*-
@jira.QANOV-492649
Feature: Consumption Details


  @jira.QANOV-492651 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with mobile product can see data consumption details page
    TBD names of the cms modules. Events displayed come from API, they can be used or extra data from the plan and extra pack data. Breakdown by date.
    Given user has a "mobile" plan
      And user has made consumption on the "data" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details" page
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield with the "\d\d\d \d\d\d \d\d\d" format is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is on display
      And the "data" tab is selected
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "\d+(,\d{2})? (MB|GB)" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "\d+,\d\d €" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "data_consumed" textfield with the "\d+(,\d{2})? (MB|GB)" format
      And each element in the "events_list" list has the "consumption_subtitle" textfield with "Datos móviles" text
      And each element in the "events_list" list has the "price" textfield with the "(-)?\d+,\d\d €" format
      And the elements in the "events_list_dates" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-492650 @android @e2e @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Convergente with mobile product can access the data consumption details page
    TBD names of the cms modules. Events displayed come from API, they can be used or extra data from the plan and extra pack data. Breakdown by date.
    Given user has a "convergente" plan
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details" page
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Line Dashboard" page is displayed

  @jira.QANOV-492653 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with mobile product can see the calls consumption details page
    TBD names of the cms modules. Events displayed come from API, they can be used and extra minutes. Breakdown by date.
    Given user has a "mobile" product
      And user has made consumption on the "minutes" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details" page
      And user is in the "Consumption Details" page
     Then the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is on display
      And clicks on the "minutes" tab
      And the "minutes" tab is selected
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "(\d{1,2}(min|s|h)){1,3}" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "\d+,\d\d €" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "duration" textfield with the "\d{1,2}:\d\d (\s?\d{1,2}(min|s|h)){1,3}" format
      And each element in the "events_list" list has the "type_of_call" field that contains the "Llamada" text
      And each element in the "events_list" list has the "price" textfield with the "\d+,\d\d €" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.QANOV-492654 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with landline product can see the calls consumption details page
    TBD names of the cms modules. Events displayed come from API, they can be used and extra minutes. Breakdown by date.
    Given user has a "internet" plan
      And user has made consumption on the "minutes" allowances in the "landline" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details" page
      And user is in the "Landline Dashboard" page
     When clicks on the "minutes_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is not displayed
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "(\d{1,2}(min|s|h)){1,3}" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "\d+,\d\d €" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "duration" textfield with the "\d{1,2}:\d\d (\s?\d{1,2}(min|s|h)){1,3}" format
      And each element in the "events_list" list has the "type_of_call" field that contains the "Llamada" text
      And each element in the "events_list" list has the "price" textfield with the "\d+,\d\d €" format
      And the elements in the "events_list_dates" list are ordered by date descendant
      And clicks on the "navigation_top_bar.back_button" button
      And the "Landline Dashboard" page is displayed

  @jira.QANOV-492656 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with mobile product can see the sms consumption details page
    TBD names of the cms modules. Events displayed come from API, they can be ised or extra sent sms from the plan. Breakdown by date.
    Given user has a "mobile" product
      And user has made consumption on the "sms" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "consumption-events-list-postpay" module configured in CMS for "consumption-details" page
      And user is in the "Consumption Details" page
     Then the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is on display
      And clicks on the "sms" tab
      And the "sms" tab is selected
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "(\d{1,2}(min|s|h)){1,3}" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "\d+,\d\d €" format is displayed
      And the "events_list" list is displayed
      And each element in the "events_list" list has the "icon" field
      And each element in the "events_list" list has the "destination_name" field
      And each element in the "events_list" list has the "icon_received_send" field
      And each element in the "events_list" list has the "date_time" textfield with the "\d\d:\d\d" format
      And each element in the "events_list" list has the "type_of_sms" textfield with the "(SMS|MMS)" format
      And each element in the "events_list" list has the "price" textfield with the "\d+,\d\d €" format
      And the elements in the "events_list_dates" list are ordered by date descendant

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User who hasn't consumed data sees an informative message
    Given user has a "<plan>" plan
      And user has not made consumption on the "data" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "empty-case-data-card" module configured in CMS for "consumption-details" page
      And user is in the "<page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is on display
      And the "data" tab is selected
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "0 GB" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "0,00 €" format is displayed
      And the "empty_case_card" card is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.title" textfield is displayed
      And the "empty_case_card.text" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | plan        | page                  | jira_id      |
          | convergente | Mobile Line Dashboard | QANOV-492657 |
          | mobile      | Account               | QANOV-492658 |

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User who hasn't consumed calls sees an informative message
    Given user has a "<plan>" plan
      And user has not made consumption on the "calls" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "empty-case-calls-card" module configured in CMS for "consumption-details" page
      And user is in the "<page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is on display
      And clicks on the "minutes" tab
      And the "minutes" tab is selected
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "0 min" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "0,00 €" format is displayed
      And the "empty_case_card" card is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.title" textfield is displayed
      And the "empty_case_card.text" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | plan        | page                  | jira_id      |
          | convergente | Mobile Line Dashboard | QANOV-492659 |
          | mobile      | Account               | QANOV-492660 |

  @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User with landline who hasn't consumed calls sees an informative message
    Given user has a "internet" plan
      And user has not made consumption on the "calls" allowances in the "landline" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "empty-case-calls-card" module configured in CMS for "consumption-details" page
      And user is in the "Landline Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is not displayed
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "0 min" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "0,00 €" format is displayed
      And the "empty_case_card" card is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.title" textfield is displayed
      And the "empty_case_card.text" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Landline Dashboard" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: User who hasn't consumed sms sees an informative message
    Given user has a "<plan>" plan
      And user has not made consumption on the "sms" allowances in the "mobile_line" product
      And user has the "billing-cycle-header" module configured in CMS for "consumption-details" page
      And user has the "consumption-extra" module configured in CMS for "consumption-details" page
      And user has the "empty-case-sms-card" module configured in CMS for "consumption-details" page
      And user is in the "<page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption Details" page is displayed
      And the "Detalles de consumo" header is displayed
      And the "consumption_header" module is displayed
      And the "consumption_header.msisdn" textfield is displayed
      And the "consumption_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "consumption_types_tab" element is on display
      And clicks on the "sms" tab
      And the "sms" tab is selected
      And the "amount_consumed" card is displayed
      And the "amount_consumed.title" textfield with "Consumo" text is displayed
      And the "amount_consumed.value" textfield with the "0 SMS" format is displayed
      And the "extra_charges" card is displayed
      And the "extra_charges.title" textfield with "Gasto extra" text is displayed
      And the "extra_charges.value" textfield with the "0,00 €" format is displayed
      And the "empty_case_card" card is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.title" textfield is displayed
      And the "empty_case_card.text" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | plan        | page                  | jira_id      |
          | convergente | Mobile Line Dashboard | QANOV-492661 |
          | mobile      | Account               | QANOV-492662 |

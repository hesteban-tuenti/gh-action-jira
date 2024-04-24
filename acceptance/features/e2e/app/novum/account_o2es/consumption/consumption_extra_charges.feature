# -*- coding: utf-8 -*-
@jira.QANOV-492663
Feature: Consumption Extra Charges


  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.Future @manual @mobile @o2es
  Scenario Outline: A <plan> user with extra charges can access the extra charges page form the <page> page
    type name of the extra charge will come from API. Could be international call, SMS, mobile call, roaming data...
    Given user has a "<plan>" plan
      And user has extra charges
      And user is in the "<page>" page
     When clicks on the "extra_charges" module
     Then the "Extra Charges" page is displayed
      And the "Detalles de gasto extra" header is displayed
      And the "extra_charges_header" module is displayed
      And the "extra_charges_header.msisdn" textfield is displayed
      And the "extra_charges_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "extra_charges_header.text" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_header.amount" textfield with the "\d+,\d\d €" format is displayed
      And the "extra_charges_list" list is displayed
      And the "extra_charges_list" list has ">0" elements
      And the elements in the "extra_charges_list" list are ordered by date descendant
      And each element in the "extra_charges_consumption_list" list has the "icon" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_title" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_time" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_type" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charge" textfield with the "\d+,\d\d €" format
      And each element in the ".extra_charges_consumption_list" list has the "consumption_extra_charge" element with "red" color
      And clicks on the "navigation_top_bar.back_button" button
      And the "<page>" page is displayed

    Examples:
          | plan        | page               | priority | ber | jira_id      |
          | mobile      | Account            | smoke    |     | QANOV-492664 |
          | internet    | Landline Dashboard | smoke    |     | QANOV-492665 |
          | convergente | Landline Dashboard | smoke    |     | QANOV-492666 |
          | convergente | Mobile Dashboard   | sanity   | ber | QANOV-492667 |

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: A user without extra charges can access the extra charges page
    Given user has no extra charges
      And user is in the "Extra Charges" page
     Then the "Detalles de gasto extra" header is displayed
      And the "extra_charges_header.msisdn" textfield is displayed
      And the "extra_charges_header.billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "extra_charges_header.amount" textfield with "0,00 €" text is displayed
      And the "empty_case_card" module is displayed
      And the "empty_case_card.icon" icon is displayed
      And the "empty_case_card.title" textfield is displayed
      And the "empty_case_card.text" textfield is displayed
      And the "extra_charges_list" list is not displayed

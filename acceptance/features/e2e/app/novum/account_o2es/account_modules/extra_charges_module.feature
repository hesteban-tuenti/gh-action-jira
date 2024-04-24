# -*- coding: utf-8 -*-
@jira.QANOV-492966
Feature: Extra Charges Module


  @jira.<jira_id> @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario Outline: A user with <product> product can see the extra charges module for his/her active mobile line
    Given user has a "<product>" product
      And user is in the "<page>" page
     Then the "extra_charges" module is displayed
      And the "extra_charges.billing_cycle_box" element is on display
      And the "extra_charges.extra_amount_box" element is on display
      And the "extra_charges.billing_cycle_box.title" textfield with "Tu ciclo acaba en" text is displayed
      And the "extra_charges.billing_cycle_box.description" textfield with the "\d+ (días|dia)" format is displayed
      And the "extra_charges.extra_amount_box.title" textfield with "Gastoo extra" text is displayed
      And the "extra_charges.extra_amount_box.amount" textfield with the "\d+,\d\d €" format is displayed

    Examples:
          | product  | page               | jira_id      |
          | mobile   | Mobile Dashaboard  | QANOV-492967 |
          | landline | Landline Dashboard | QANOV-492968 |

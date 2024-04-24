# -*- coding: utf-8 -*-
@jira.QANOV-492939
Feature: Landline Dashboard

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario Outline: A <plan> user can access the Landline dashboard
    TBD the names of the modules
    Given user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user has the "Subscription description;Consumption counters for a single subscription;Extra Charges Double Panel" modules configured in CMS for "Landline" page
     When clicks on the "no_mobile_subscriptions.landline" icon
     Then the "Landline Dashboard" page is displayed
      And the "Fijo" header is displayed
      And the "subscription_description" module is displayed
      And the "subscription_description.icon" icon is displayed
      And the "subscription_description.title" textfield with the "\d\d\d \d\d \d\d \d\d" format is displayed
      And the "counters_carousel" module is displayed
      And the "extra_charges_section_title" textfield is displayed
      And the "extra_charges" module is displayed

    Examples:
          | plan        | ber | jira_id      |
          | internet    | ber | QANOV-492940 |
          | convergente |     | QANOV-492941 |

# -*- coding: utf-8 -*-
@jira.QANOV-493010
Feature: Dashboard

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.QANOV-493011 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity @tbd
  Scenario: A mobile user can see the account dashboard for his/her active mobile line
    TBD the names of the modules. Explore module will contain O2 cloud card + other cards configured by the OB
    Given user has a "mobile" plan
      And user has the matching subscription selected in the account
      And user has the "Subscription description;Consumption counters for a single subscription;Extra Charges Double Panel;Bundle Purchase Card;Services List; Explore Widget" modules configured in CMS for "Mobile Dashboard" page
     Then the "account_header" textfield with the "Hola, [CONTEXT:user.name]" format is displayed
      And the "subscription_selector" module is displayed
      And the "counters_carousel" module is displayed
      And the "extra_charges_section_title" textfield is displayed
      And the "extra_charges" module is displayed
      And the "services_section_title" textfield is displayed
      And the "bundle_purchase_card" module is displayed
      And the "services_module" module is displayed
      And the "explore_section_title" textfield is displayed
      And the "explore_module" module is displayed

  @jira.QANOV-493012 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity @tbd
  Scenario: An internet user can see the account dashboard
    TBD the names of the modules. Internet plan has internet + landline. Explore module will contain O2 cloud card + other cards configured by the OB
    Given user has a "internet" plan
      And user has the matching subscription selected in the account
      And user has the "Subscription description;Consumption counters for a single subscription;Extra Charges Double Panel;Non Mobile Subscriptions; Explore Widget" modules configured in CMS for "Account" page
     Then the "account_header" textfield with the "Hola, [CONTEXT:user.name]" format is displayed
      And the "subscription_selector" module is displayed
      And the "counters_carousel" module is displayed
      And the "no_mobile_subscriptions" module is displayed
      And the "extra_charges_section_title" textfield is displayed
      And the "extra_charges" module is displayed
      And the "services_section_title" textfield is displayed
      And the "explore_section_title" textfield is displayed
      And the "explore_module" module is displayed

  @jira.QANOV-493013 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity @tbd
  Scenario: A convergente user can see the account dashboard
    TBD the names of the modules. Convergente plan has internet + landline + mobile line. There is also an optional module regarding r2r device checked in another scenario.
    Explore module will contain O2 cloud card + other cards configured by the OB
    Given user has a "convergente" plan
      And user has the matching subscription selected in the account
      And user has the "Subscription description;Consumption counters for a single subscription;Extra Charges Double Panel;Non Mobile Subscriptions;Services List" modules configured in CMS for "Account" page
     Then the "account_header" textfield with the "Hola, [CONTEXT:user.name]" format is displayed
     Then the "subscription_description" module is displayed
      And the "counters_carousel" module is displayed
      And the "no_mobile_subscriptions" module is displayed
      And the "explore_section_title" textfield is displayed
      And the "explore_module" module is displayed

  @jira.QANOV-493014 @android @ber @ios @jira.cv.Future @mobile @no_automatable @o2es @sanity
  Scenario: A multiplan user can change the plan from the subscription selector list
    Given user has a "multiplan" plan
     When clicks on the "subscription_selector" drop-down
      And clicks on the "1" element in the "subscription_selector_list" list
     Then the Account dashboard displays the information regarding the selected plan

# -*- coding: utf-8 -*-
@jira.QANOV-492942
Feature: Mobile Dashboard

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.QANOV-492943 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user can access the Mobile dashboard
    TBD the names of the modules
    Given user has a "convergente" plan
      And user has the matching subscription selected in the account
      And user has the "Subscription description;Consumption counters for a single subscription;Extra Charges Double Panel;Bundle Purchase Card;Services List" modules configured in CMS for "Mobile" page
     When clicks on the "counters_carousel.mobile_consumption" icon
     Then the "Mobile Dashboard" page is displayed
      And the "Línea Móvil" header is displayed
      And the "subscription_description" module is displayed
      And the "subscription_description.icon" icon is displayed
      And the "subscription_description.subtitle" textfield with the "\d\d\d \d\d \d\d \d\d" format is displayed
      And the "counters_carousel" module is displayed
      And the "extra_charges_section_title" textfield is displayed
      And the "extra_charges" module is displayed
      And the "services_section_title" textfield is displayed
      And the "bundle_purchase" module is displayed
      And the "services_module" module is displayed
      And the "explore_section_title" textfield is displayed
      And the "explore_module" module is displayed

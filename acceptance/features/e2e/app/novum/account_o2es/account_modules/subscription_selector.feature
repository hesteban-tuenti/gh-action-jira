# -*- coding: utf-8 -*-
@jira.QANOV-492969
Feature: Subscription Selector

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.QANOV-492970 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A mobile user can see the details of the subscription selector
    Given user has a "mobile" product
     Then the "subscription_selector" module is displayed
      And the "subscription_selector.title" textfield with the "Móvil +\d GB" format is displayed
      And the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.subtitle" textfield with the "\d\d\d \d\d \d\d \d\d" format is displayed

  @jira.QANOV-492971 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An internet user can see the details of the subscription selector
    Given user has a "internet" plan
     Then the "subscription_selector" module is displayed
      And the "subscription_selector.title" textfield that contains the "Fibra" text is displayed
      And the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.subtitle" textfield with the "9\d\d \d\d \d\d \d\d" format is displayed

  @jira.QANOV-492972 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user can see the details of the subscription selector
    Given user has a "convergente" plan
     Then the "subscription_selector" module is displayed
      And the "subscription_description.title" textfield that contains the "y móvil" text is displayed
      And the "subscription_description.icon" icon is displayed

  @jira.QANOV-492973 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A multiplan user can see the plans in the subscription selector list
    Given user has a "multiplan" plan
      And user has "0" plans pending activation
     When clicks on the "subscription_selector" drop-down
     Then the "subscription_selector_list" list has ">1" elements
      And each element in the "subscription_selector_list" list has the "title" field matching a subscription display name
      And each element in the "subscription_selector_list" list has the "icon" field
      And each element in the "subscription_selector_list" list has the "subtitle" field

  @jira.QANOV-492974 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user with a plan pending to activate can see the plans in the subscription selector list
    Given user has a "multiplan" plan
      And user has ">0" plans pending activation
     When clicks on the "subscription_selector" drop-down
      And any element in the "subscription_selector" list has the "title" textfield with the "En proceso de activación" text

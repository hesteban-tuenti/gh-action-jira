# -*- coding: utf-8 -*-
@jira.QANOV-326025
Feature: Explore module

  Actions Before the Feature:
    Given user has content for the "TBD" category in CMS for account

  Actions Before each Scenario:
    Given user has a "telco" account type
      And user has a "any_admin" role


  @jira.QANOV-326026 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: A user can see a feature content carousel when there are at least one card configured in the CMS in the Dashboard page
    Given user is in the "Dashboard" page
      And user has the "explore-content" module configured in CMS for "dashboard" page
     Then the "featured_content_title" textfield with "Seleccionado para ti" text is displayed
      And the "featured_content_carousel" carousel is displayed
      And each card in the "featured_content_carousel" carousel has the "image" field
      And each card in the "featured_content_carousel" carousel has the "pretitle" field
      And each card in the "featured_content_carousel" carousel has the "title" field
      And each card in the "featured_content_carousel" carousel has the "description" field

  @jira.QANOV-285361 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A user can see a feature content carousel with navball when there are severals cards configured in the CMS in the Dashboard page
    Given user is in the "Dashboard" page
      And user has the "explore-widget" module configured in CMS for "dashboard" page
     Then the "featured_content_title" textfield with "Seleccionado para ti" text is displayed
      And the "featured_content_carousel" list has ">1" elements
      And the "featured_content.navball" element is on display

  @jira.QANOV-326027 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A user can see a tag on a card in the featured content carousel in the Dashboard page
    Given user has a card with tag for "any_account" categories
      And user has the "explore-widget" module configured in CMS for "dashboard" page
      And user is in the "Dashboard" page
     Then the "featured_content_card_tag" textfield is displayed

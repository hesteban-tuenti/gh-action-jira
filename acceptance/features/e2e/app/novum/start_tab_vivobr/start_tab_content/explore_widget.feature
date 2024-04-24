# -*- coding: utf-8 -*-
@jira.QANOV-424435
Feature: Explore widget


  @jira.QANOV-424436 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see a main promotion card in the Start tab
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "main_promotion" card is displayed
      And the "main_promotion.image" textfield is displayed
      And the "main_promotion.title" textfield is displayed
      And the "main_promotion.description" textfield is displayed

  @jira.QANOV-424437 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see the main upgrades cards carousel in the Start tab
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "main_upgrades_title" textfield is displayed
      And the "main_upgrades" carousel is displayed
      And each element in the "main_upgrades" carousel has the "image" field
      And each element in the "main_upgrades" carousel has the "title" field
      And each element in the "main_upgrades" carousel has the "description" field

  @jira.QANOV-424438 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see the SVAs cards carousel in the Start tab
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "svas_title" textfield is displayed
      And the "svas" carousel is displayed
      And each element in the "svas" carousel has the "image" field
      And each element in the "svas" carousel has the "title" field
      And each element in the "svas" carousel has the "description" field
      And each element in the "svas" carousel has the "price" field
      And the "svas_link" link is displayed

  @jira.QANOV-424439 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see the main upgrades cards carousel in the Start tab
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "other_products_title" textfield is displayed
      And the "other_products" carousel is displayed
      And each element in the "other_products" carousel has the "image" field
      And each element in the "other_products" carousel has the "title" field
      And each element in the "other_products" carousel has the "description" field

  @jira.QANOV-424440 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see the main tech products cards carousel in the Start tab
    This element can have several fields configured in the CMS, only checking the main ones
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "main_tech_products_title" textfield is displayed
      And the "main_tech_products" carousel is displayed
      And each element in the "main_tech_products" carousel has the "image" field
      And each element in the "main_tech_products" carousel has the "title" field
      And each element in the "main_tech_products" carousel has the "description" field

  @jira.QANOV-424441 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see information related to Vivo cards carousel in the Start tab
    This element can have several fields configured in the CMS, only checking the main ones
    Given user has the "TBD" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "vivo_info_related_title" textfield is displayed
      And the "vivo_info_related" carousel is displayed
      And each element in the "vivo_info_related" carousel has the "image" field
      And each element in the "vivo_info_related" carousel has the "title" field
      And each element in the "vivo_info_related" carousel has the "description" field

  @jira.QANOV-517452 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: A user will no see the main upgrades cards carousel in the Start tab during a maintenance window
    Given user has the "TBD" module configured in CMS for "start" page
      And there is a maintenance window
      And user is in the "Start" page
     Then the "main_upgrades_title" textfield is not displayed
      And the "main_upgrades" carousel is not displayed

  @jira.QANOV-517453 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: A user will see the permitted explore cards in the Start tab during a maintenance window
    Given user has the "TBD" module configured in CMS for "start" page
      And user has the "TBD" module configured in CMS for "start" page
      And user has the "TBD" module configured in CMS for "start" page
      And user has the "TBD" module configured in CMS for "start" page
      And user has the "TBD" module configured in CMS for "start" page
      And there is a maintenance window
      And user is in the "Start" page
     Then the "main_promotion" card is displayed
      And the "svas" carousel is displayed
      And the "other_products" carousel is displayed
      And the "main_tech_products" carousel is displayed
      And the "vivo_info_related" carousel is displayed

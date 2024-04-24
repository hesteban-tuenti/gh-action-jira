# -*- coding: utf-8 -*-
@jira.QANOV-442215
Feature: Data cards advanced

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.QANOV-446181 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: User can see a Data cards advanced module without title
    Given user has a "data cards advanced" module without title in the Explore content
     When searches the "module"
     Then the "data cards advanced" module is displayed
      And the selected explore "module" has no title

  @jira.QANOV-442217 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke @vivobr
  Scenario: User can see a section title in the Data cards advanced module
    Given user has a "data cards advanced" module in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

  @jira.QANOV-446183 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke @vivobr
  Scenario: User can see a card title in the Data cards advanced card
    Given user has a "data cards advanced" card with "title" in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "card_title" field with "[CONTEXT:card_title]" text

  @jira.QANOV-446185 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke @vivobr
  Scenario: User can see the vivinho icon with the card title in the Data cards advanced card
    Given user has a "data cards advanced" card with "vivinho_icon" in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "card_title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "vivinho_icon" field displayed

  @jira.QANOV-446186 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: User can see a tag in a Data cards advanced card
    Given user has a "data cards advanced" card with "price" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

  @jira.QANOV-442222 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke @vivobr
  Scenario: User can see a heading in a Data cards advanced card with a highlighted slot
    Given user has a "data card advanced" card with "highlighted" slot with "heading" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "heading" field with "[CONTEXT:card_heading]" text

  @jira.QANOV-442223 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: User can see a value text in a Data cards advanced card with a highlighted slot
    Given user has a "data card advanced" card card with "highlighted" slot with "value_text" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "heading" field with "[CONTEXT:card_heading]" text
      And the selected explore "card" has the "value_text" field with "[CONTEXT:value_text]" text

  @jira.QANOV-442224 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: User can see a secondary value in a Data cards advanced card with a highlighted slot
    Given user has a "data card advanced" card card with "highlighted" slot with "secondary_value" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "secondary_value" field with "[CONTEXT:card_secondary_value]" text

  @jira.QANOV-442225 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: User can see a support text in a Data cards advanced card with a highlighted slot
    Given user has a "data card advanced" card card with "highlighted" slot with "support_text" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "support_text" field with "[CONTEXT:card_support_text]" text

  @jira.QANOV-442226 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke @vivobr
  Scenario: User can see a content title in a Data cards advanced card with a highlighted slot
    Given user has a "data card advanced" card card with "highlighted" slot with "content_title" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "content_title" field with "[CONTEXT:card_content_title]" text

  @jira.QANOV-442227 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @smoke @vivobr
  Scenario: User can see a content subtitle in a Data cards advanced card with a highlighted slot
    Given user has a "data card advanced" card card with "highlighted" slot with "content_subtitle" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "content_subtitle" field with "[CONTEXT:card_content_subtitle]" text

  @jira.QANOV-442228 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: User can see a content description in a Data cards advanced card
    Given user has a "data card advanced" card with "content_desc" in the Explore module content
     When searches the "card"
     Then the selected explore "card" has the "content_desc" field with "[CONTEXT:content_desc]" text

  @jira.QANOV-442229 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @sanity @vivobr
  Scenario: User can see the image in a Data cards advanced with a stacking slot
    Given user has a "data card advanced" card card with "stacking" slot with "image" in the Explore module content
     When searches the "card"
     Then the selected explore card has the "image" media field displayed

  @jira.QANOV-446188 @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @regression
  @vivobr
  Scenario: Data cards advanced module is swiped automatically if autoplay is enabled in the cms
    TBD how many seconds takes for autoplay to swipe between cards
    Given user has a "data cards advanced" module with autoplay activated
     When searches the "module"
      And takes a screenshot of the carousel
      And waits "tbd" seconds
     Then the carousel is not in the same position as before

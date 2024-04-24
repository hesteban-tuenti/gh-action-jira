# -*- coding: utf-8 -*-
@jira.QANOV-124987
Feature: Explore Module

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: Explore module is displayed on the account dashboard if there are cards configured in the CMS for the account
    There will be as many cards on the module as configured in the cms. You can create/edit the needed cards in the dev cms.
    Given user has a "<account_type>" account type
      And there are ">0" account cards configured in the cms
      And user has the "explore-content" module configured in CMS for "dashboard" page for the plan selected
     Then the "explore" module is displayed
      And the "featured_content_module_title" textfield is displayed
      And the "featured_content_card" card is displayed
      And the "image_or_bumper" for the Explore "featured_content_card" is displayed
      And the "featured_content_card_pretitle" textfield is displayed
      And the "featured_content_card_title" textfield is displayed
      And the "featured_content_card_description" textfield is displayed
      And the "see_more" link is displayed

    Examples:
          | account_type  | parent_test_plan | jira_id      |
          | beatrix       |                  | QANOV-124989 |
          | multivivo     |                  | QANOV-124990 |
          | convergente   |                  | QANOV-124988 |
          | legacy prepay | QANOV-132105     | QANOV-133824 |
          | jeri prepay   | QANOV-132105     | QANOV-272646 |
          | jeri control  | QANOV-200803     | QANOV-202380 |
          | control_n     | QANOV-200803     | QANOV-202381 |

  @jira.QANOV-124991 @android @ios @jira.cv.12.8 @manual @mobile @smoke @vivobr @old_app
  Scenario: Explore module is displayed on the account dashboard if there are cards configured in the CMS for the account
    There will be as many cards on the module as configured in the cms. You can create/edit the needed cards in the dev cms.
    Given user has any "legacy control;legacy postpay" account types
      And user has "several" plans
      And there are ">0" account cards configured in the cms
      And user has the "explore-content" module configured in CMS for "dashboard" page
     Then the "explore" module is displayed
      And the "featured_content_module_title" textfield is displayed
      And the "featured_content_card" card is displayed
      And the "image_or_bumper" for the Explore "featured_content_card" is displayed
      And the "featured_content_card_pretitle" textfield is displayed
      And the "featured_content_card_title" textfield is displayed
      And the "featured_content_card_description" textfield is displayed
      And the "see_more" link is displayed

  @jira.QANOV-125000 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-200803 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: User can open a card from the explore module
    You can create/edit the needed cards in the dev cms. The link will open whatever it is configured in the card_action_url field from the cms
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri control;control_n" account types
      And there are ">0" account cards configured in the cms
      And user has the "explore-content" module configured in CMS for "dashboard" page
     When clicks on the "see_more" link
     Then the Explore card is opened

  @jira.QANOV-125001 @android @ios @jira.cv.12.8 @manual @mobile @smoke @vivobr @old_app
  Scenario: User can open a card from the explore module
    You can create/edit the needed cards in the dev cms. The link will open whatever it is configured in the card_action_url field from the cms
    Given user has any "legacy control;legacy postpay" account types
      And user has "several" plans
      And user has the "explore-content" module configured in CMS for "dashboard" page
      And there are ">0" account cards configured in the cms
     When clicks on the "see_more" link
     Then the Explore card is opened

  @jira.QANOV-125006 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-200803 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Explore carousel in account can be scrolled horizontally
    You can create/edit the needed cards in the dev cms.
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri control;control_n" account types
      And user has the "explore-content" module configured in CMS for "dashboard" page
      And user has ">1" account cards configured in the cms
     Then swipes from "right to left" over "featured_content_module" carousel element
      And swipes from "left to right" over "featured_content_module" carousel element

  @jira.QANOV-125007 @android @ios @jira.cv.12.8 @manual @mobile @regression @vivobr @old_app
  Scenario: Explore carousel in account can be scrolled horizontally
    You can create/edit the needed cards in the dev cms.
    Given user has any "legacy control;legacy postpay" account types
      And user has "several" plans
      And user has the "explore-content" module configured in CMS for "dashboard"
      And user has ">1" account cards configured in the cms
     Then swipes from "right to left" over "featured_content_module" carousel element
      And swipes from "left to right" over "featured_content_module" carousel element

  @jira.QANOV-125008 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-200803 @mobile @no_automatable
  @regression @vivobr @old_app
  Scenario: Expired cards are not displayed in the explore account module
    You can create/edit the needed cards in the dev cms.
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri control;control_n" account types
      And user has the "explore-content" module configured in CMS for "dashboard"
      And there is an explore account card with an expired validity period configured in the cms
     Then the "expired_card" card is not displayed

  @jira.QANOV-125009 @android @ios @jira.cv.12.8 @mobile @no_automatable @regression @vivobr @old_app
  Scenario: Expired cards are not displayed in the explore account module
    You can create/edit the needed cards in the dev cms.
    Given user has any "legacy control;legacy postpay" account types
      And user has "several" plans
      And there is an explore account card with an expired validity period configured in the cms
     Then the "expired_card" card is not displayed

  @jira.QANOV-125010 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-200803 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Explore module is not displayed if there are no cards configured by the CMS for the account
    You can create/edit the needed cards in the dev cms.
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri control;control_n" account types
      And there are "0" account cards configured in the cms
     Then the "explore" module is not displayed

  @jira.QANOV-125011 @android @ios @jira.cv.12.8 @manual @mobile @regression @vivobr @old_app
  Scenario: Explore module is not displayed if there are no cards configured by the CMS for the account
    You can create/edit the needed cards in the dev cms.
    Given user has any "legacy control;legacy postpay" account types
      And user has "several" plans
      And there are "0" account cards configured in the cms
     Then the "explore" module is not displayed

  @jira.QANOV-125012 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-200803 @mobile @no_automatable
  @regression @vivobr @old_app
  Scenario: Loading skeleton is displayed while the explore module is loading
    You can create/edit the needed cards in the dev cms.
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri control;control_n" account types
      And user has the "explore-content" module configured in CMS for "dashboard" page
     When the explore module content is loading
     Then the "loading_skeleton" element is displayed

  @jira.QANOV-125013 @android @ios @jira.cv.12.8 @mobile @no_automatable @regression @vivobr @old_app
  Scenario: Loading skeleton is displayed while the explore module is loading
    You can create/edit the needed cards in the dev cms.
    Given user has any "legacy control;legacy postpay" account types
      And user has "several" plans
      And user has the "explore-content" module configured in CMS for "dashboard" page
     When the explore module content is loading
     Then the "loading_skeleton" element is displayed

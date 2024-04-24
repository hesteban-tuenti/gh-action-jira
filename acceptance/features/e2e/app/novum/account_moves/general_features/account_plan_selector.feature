# -*- coding: utf-8 -*-
@jira.QANOV-8028
Feature: Account plan selector


  @jira.QANOV-8033 @android @no_automatable @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47639 @mobile @moves @qa @smoke
  @impeded_legacy
  Scenario: Legado Postpay user with only one plan accesses to the account section: the plan is displayed
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has "1" plans
      And user does not have a "pikolin" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "plan_name" textfield is displayed
      And the "plan_selector_carousel" element is not on display

  @jira.QANOV-8047 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47644 @manual @mobile @moves @smoke @impeded_legacy
  Scenario: User with several plans accesses to the account: a carousel with the plans is displayed
    Given user has a "any_admin" role
      And user has a "legado" account type
      And user has "several" plans
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "plan_selector_carousel" carousel is displayed
      And the "plan_selector_carousel" carousel can be swiped in "right" direction
      And the "plan_selector_carousel" carousel can be swiped in "left" direction

  @jira.QANOV-8053 @android @automation.hard @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47659 @manual @mobile @moves
  @regression @impeded_legacy
  Scenario: Legado ADMIN user switches to a postpay plan: the corresponding plan will be displayed
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "any_admin" role
      And user has a "legado postpay" account type
      And user has "several" plans
      And user does not have a "pikolin" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on a "postpay plan" in the "plan_selector_carousel" carousel
     Then the "plan_name" textfield is displayed
      And the corresponding plan's information is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves @regression @impeded_legacy
  Scenario Outline: Legado user with <plans> plans accesses to the account section: no plan selector is displayed
    Given user has "<plans>" plans
      And user has a "legado" account type
      And user has a "any_admin" role
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "plan_selector_carousel" carousel is not displayed

    Examples:
          | plans   | jira_id      |
          | 1       | QANOV-194542 |
          | several | QANOV-194543 |

# -*- coding: utf-8 -*-
@jira.QANOV-224232
Feature: Subscription selector


  @jira.QANOV-224233 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @live @mobile @next @qa @smoke @webapp
  Scenario: A user with only 1 product cannot see the product selector in the account dashboard
    Given user has "1" products
      And user is in the "Account" page
     Then the "subscription_selector.button" button is not displayed

  @jira.QANOV-224234 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @live @mobile @next @qa @smoke @webapp
  Scenario: A multiproduct user can see the product selector in the account dashboard
    Given user has "several" products
      And user is in the "Account" page
     Then the "subscription_selector.button" button is displayed

  @jira.QANOV-224235 @android @automatic @blaude @cert3 @ios @jira.cv.13.9 @live @mobile @next @qa @smoke @webapp
  Scenario: A multiproduct user can see a mobile line product in the product selector
    Given user has "several" products
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield is displayed
      And the "subscription_selector.subtitle" textfield is displayed

  @jira.QANOV-224236 @android @blaude @ios @jira.cv.13.9 @manual @mobile @smoke
  Scenario: A multiproduct user can see a MyHandy product in the product selector
    A "subscription_selector.subtitle" textfield can be displayed if the MyHandy product has an alias.
    Given user has "several" products
      And user has a "my_handy" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield is displayed

  @jira.<jira_id> @android @automatic @ber @blaude @ios @jira.cv.13.9 @mobile @sanity @webapp @raitt_drop1
  Scenario Outline: User with several products can switch to a <product> product
    Given user has "several" products
      And user has a "<product>" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the account content corresponds to the "<product>" product

    @cert3 @live @next @qa
    Examples:
          | product     | jira_id      |
          | mobile_line | QANOV-224237 |

    @qa
    Examples:
          | product  | jira_id      |
          | my_handy | QANOV-224238 |

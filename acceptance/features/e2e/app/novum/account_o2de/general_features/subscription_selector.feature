# -*- coding: utf-8 -*-
@jira.QANOV-224181
Feature: Product selector


  @jira.QANOV-224182 @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A user with only 1 product cannot see the product selector in the account dashboard
    Given user has "1" products
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.button" button is not displayed

  @jira.QANOV-224183 @ber @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario: A multiproduct user can see the product selector in the account dashboard
    Given user has "several" products
      And user has the "Product selector" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "subscription_selector.button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @smoke
  Scenario Outline: A multiproduct user can see a <product> product in the product selector
    Given user has "several" products
      And user has a "<product>" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield is displayed
      And the "subscription_selector.subtitle" textfield is displayed

    Examples:
          | cv    | product          | parent_test_plan | jira_id      |
          | 14.2  | mobile_line      |                  | QANOV-224184 |
          | 14.11 | internet_at_home | QANOV-437471     | QANOV-224185 |

  @jira.QANOV-224186 @android @o2de @ios @jira.cv.14.2 @manual @mobile @smoke
  Scenario: A multiproduct user can see a MyHandy product in the product selector
    A "subscription_selector.subtitle" textfield can be displayed if the MyHandy product has an alias.
    Given user has "several" products
      And user has a "my_handy" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield is displayed

  @jira.<jira_id> @android @ios @jira.cv.<cv> @manual @mobile @o2de @sanity @ber
  Scenario Outline: User with several products can switch to a <product> product
    Given user has "several" products
      And user has a "<product>" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the account content corresponds to the "<product>" product

    Examples:
          | cv    | product          | jira_id      |
          | 14.2  | mobile_line      | QANOV-224188 |
          | 14.2  | my_handy         | QANOV-224190 |
          | 14.11 | internet_at_home | QANOV-224189 |

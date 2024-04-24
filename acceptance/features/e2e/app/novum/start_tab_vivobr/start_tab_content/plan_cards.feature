# -*- coding: utf-8 -*-
@jira.QANOV-424450
Feature: Plan cards

  Actions Before each Scenario:
    Given user has the "TBD" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A monoplan <account_type> user will see plan card in the Start tab
    Given user has any "<account_type>" account types
      And user has "1" plans
      And user has purchased "apps_use" data bundles
      And user is in the "Start" page
     Then the "plans" carousel is displayed
      And the "plans" list has "1" elements
      And each element in the "plans" carousel has the "vivinho_icon" field
      And each element in the "plans" carousel has the "title" field
      And each element in the "plans" carousel has the "meatball_menu" field
      And each element in the "plans" carousel has the "subtitle" field
      And each element in the "plans" carousel has the "progression_bar" field
      And each element in the "plans" carousel has the "data_remaining" field

    Examples:
          | account_type                               | ber | jira_id      |
          | beatrix                                    | ber | QANOV-424451 |
          | control_n;jeri control                     |     | QANOV-424452 |
          | legacy control;legacy postpay;jeri postpay |     | QANOV-424453 |

  @jira.QANOV-424454 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A monoplan multivivo user will see the plan card in the Start tab
    Given user has a "multivivo" account type
      And user has "1" plans
      And user is in the "Start" page
     Then the "plans" carousel is displayed
      And the "plans" list has "1" elements
      And each element in the "plans" carousel has the "vivinho_icon" field
      And each element in the "plans" carousel has the "title" field
      And each element in the "plans" carousel has the "meatball_menu" field
      And each element in the "plans" carousel has the "lines" textfield with the "\d linhas de celular" format
      And each element in the "plans" carousel has the "avatar_group_icon" field
      And each element in the "plans" carousel has the "progression_bar" field
      And each element in the "plans" carousel has the "data_remaining" field

  @jira.QANOV-424455 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario: A monoplan full convergente user will see the plan card in the Start tab
    Given user has a "convergente" account type
      And user has "1" mobile lines in plan
      And user has "1" plans
      And user is in the "Start" page
     Then the "plans" carousel is displayed
      And the "plans" list has "1" elements
      And each element in the "plans" carousel has the "vivinho_icon" field
      And each element in the "plans" carousel has the "title" field
      And each element in the "plans" carousel has the "meatball_menu" field
      And each element in the "plans" carousel has the "subtitle" field
      And each element in the "plans" carousel has the "progression_bar" field
      And each element in the "plans" carousel has the "data_remaining" field
      And each element in the "plans" carousel has the "fixo_products" field
      And each element in the "plans.fixo_products" list has the "info" field

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke
  @vivobr
  Scenario Outline: A monoplan convergente user without mobile lines will see the plan card in the Start tab
    Given user has a "convergente" account type
      And user has "0" mobile lines in plan
      And user has "1" plans
      And user has a "<product_plan>" plan in "active" status
      And user is in the "Start" page
     Then the "plans" carousel is displayed
      And the "plans" list has "1" elements
      And each element in the "plans" carousel has the "vivinho_icon" field
      And each element in the "plans" carousel has the "title" field
      And each element in the "plans" carousel has the "meatball_menu" field
      And each element in the "plans" carousel has the "fixo_products" field
      And each element in the "plans.fixo_products" list has the "title" field
      And each element in the "plans.fixo_products" list has the "info" field

    Examples:
          | product_plan | ber | jira_id      |
          | trio         | ber | QANOV-424456 |
          | duo          |     | QANOV-424457 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario Outline: Monoplan prepay user with <data_package> will see the plan card in the Start tab
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user has activated "<data_package>" data bundles
      And user is in the "Start" page
     Then the "plans" carousel is displayed
      And the "plans" list has "1" elements
      And each element in the "plans" carousel has the "vivinho_icon" field
      And each element in the "plans" carousel has the "title" field
      And each element in the "plans" carousel has the "meatball_menu" field
      And each element in the "plans" carousel has the "subtitle" field
      And each element in the "plans" carousel has the "progression_bar" field
      And each element in the "plans" carousel has the "data_remaining" field

    Examples:
          | data_package    | ber | jira_id      |
          | vivo_pre_turbo  | ber | QANOV-424458 |
          | vivo_pre_diario |     | QANOV-424459 |

  @jira.QANOV-424460 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @sanity
  @vivobr
  Scenario: A multiplan user will see the plan cards carousel in the Start tab
    Given user has "several" plans
      And user is in the "Start" page
     Then the "plans" carousel is displayed
      And the "plans" list has ">1" elements
      And each element in the "plans" carousel has the "vivinho_icon" field
      And each element in the "plans" carousel has the "title" field
      And each element in the "plans" carousel has the "meatball_menu" field
      And the "plans" carousel can be swiped

  @jira.QANOV-424461 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-420452 @manual @mobile @smoke @vivobr
  Scenario: User can access to meatball menu screen
    Given user is in the "Start" page
     When clicks on the "meatball_menu" button of any element of the "plans" list
     Then the "Meatball Menu" page is displayed
      And the "meatball_menu_entrypoint_list" list is displayed

  @jira.QANOV-517455 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke @vivobr
  Scenario: A user will not see the plan card in the Start tab during a maintenance window
    Given there is a maintenance window
      And user is in the "Start" page
     Then the "plans" carousel is not displayed

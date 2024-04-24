# -*- coding: utf-8 -*-
@jira.QANOV-377349
Feature: Travel module


  @jira.<jira_id> @<severity> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @vivobr
  Scenario Outline: Multiplan user with vivo travel <status> package in the tariff will see travel module in Assinatura tab
    Given user has "several" plans
      And user has "all" vivo travel "<status>" in the tariff
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield with "Travel" text is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.info" textfield with "<text_info>" text is displayed

    Examples:
          | status      | text_info                 | severity   | jira_id      |
          | included    | Incluso na sua assinatura | sanity     | QANOV-377350 |
          | no included | Assinatura adicional      | regression | QANOV-377351 |

  @jira.QANOV-453405 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: Multiplan user with vivo travel included and no included package in the tariff will see travel module in Assinatura tab
    Given user has "several" plans
      And user has "several" vivo travel package
      And user has "any" vivo travel "included" in the tariff
      And user has "any" vivo travel "no included" in the tariff
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield with "Travel" text is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.info" textfield with "Vôce pode clicar para saber mais sobre as suas assinaturas Travel" text is displayed

  @jira.QANOV-420535 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: Monoplan user with 1 type of vivo travel package will see travel module in Assinatura tab
    Given user does not have a "multivivo" account type
      And user has "1" plans
      And user has "1" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.info" textfield with the "(Incluso na sua assinatura|Assinatura adicional)" format is displayed

  @jira.QANOV-453406 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @regression
  @vivobr
  Scenario: Monoplan user with several type of vivo travel package will see travel module in Assinatura tab
    Given user does not have a "multivivo" account type
      And user has "1" plans
      And user has "several" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield with "Travel" text is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.products_list" list is displayed
      And each element in the "travel.products_list" list has the "name" field
      And each element in the "travel.products_list" list has the "info" textfield with the "(Incluso na sua assinatura|Assinatura adicional)" format

  @jira.QANOV-605486 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: Multivivo monoplan user with 1 type of vivo travel package will see travel module in Assinatura tab
    Given user has a "multivivo" account type
      And user has "1" plans
      And user has "1" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.avatar_icon" icon is displayed

  @jira.QANOV-605487 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @regression
  @vivobr
  Scenario: Multivivo monoplan user with several type of vivo travel package will see travel module in Assinatura tab
    Given user has a "multivivo" account type
      And user has "1" plans
      And user has "several" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield with "Travel" text is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.products_list" list is displayed
      And each element in the "travel.products_list" list has the "name" field
      And each element in the "travel.products_list" list has the "avatar_icon" field

  @jira.QANOV-377354 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario: User will not see travel module in Assinatura tab
    Given user does not have vivo travel in the plans
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is not displayed

  @jira.QANOV-605488 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: User can see footer in vivo travel card
    Given user has "any" vivo travel package in the plans
      And user does not have "mundo" vivo travel package
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.upgrade_text" textfield with "Vai viajar pra outro lugar?" text is displayed
      And the "travel.upgrade_link" link with "Adicionar regiões" text is displayed

  @jira.QANOV-605489 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: User can not see footer in vivo travel card
    Given user has "any" vivo travel package in the plans
      And user has "mundo" vivo travel package
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     Then the "travel" card is displayed
      And the "travel.footer" element is not displayed

  @jira.QANOV-377356 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: User can access to Vivo travel screen from footer
    Given user has "any" vivo travel package in the plans
      And user does not have "mundo" vivo travel package
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     When clicks on the "travel.upgrade_link" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed

  @jira.QANOV-599186 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity @vivobr
  Scenario: User can access to Vivo travel screen
    Given user has "any" vivo travel package in the plans
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     When clicks on the "travel" card
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Assinatura" page is displayed

  @jira.QANOV-377357 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User can access to meatball menu screen from Vivo travel module
    Given user has "any" vivo travel package in the plans
      And user has the "travel-card" module configured in CMS for "dashboard-user" page
      And user is in the "Assinatura" page
     When clicks on the "travel.meatball_menu" button
     Then the "Meatball Menu" page is displayed
      And the "meatball_menu_entrypoint_list" list is displayed

  @jira.QANOV-605490 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke
  @vivobr
  Scenario: Monoplan user with 1 type of vivo travel package will see travel module in plan details page
    Given user does not have a "multivivo" account type
      And user has "1" plans
      And user has "1" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.info" textfield with the "(Incluso na sua assinatura|Assinatura adicional)" format is displayed

  @jira.QANOV-605491 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: Monoplan user with several type of vivo travel package will see travel module in plan details page
    Given user does not have a "multivivo" account type
      And user has "1" plans
      And user has "several" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield with "Travel" text is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.products_list" list is displayed
      And each element in the "travel.products_list" list has the "name" field
      And each element in the "travel.products_list" list has the "info" textfield with the "(Incluso na sua assinatura|Assinatura adicional)" format

  @jira.QANOV-605492 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: Multivivo monoplan user with 1 type of vivo travel package will see travel module in plan details page
    Given user has a "multivivo" account type
      And user has "1" plans
      And user has "1" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.avatar_icon" icon is displayed

  @jira.QANOV-605493 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @regression
  @vivobr
  Scenario: Multivivo monoplan user with several type of vivo travel package will see travel module in plan details page
    Given user has a "multivivo" account type
      And user has "1" plans
      And user has "several" type of vivo travel package in the plan
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.vivinho" icon is displayed
      And the "travel.title" textfield with "Travel" text is displayed
      And the "travel.meatball_menu" button is displayed
      And the "travel.products_list" list is displayed
      And each element in the "travel.products_list" list has the "name" field
      And each element in the "travel.products_list" list has the "avatar_icon" field

  @jira.QANOV-453407 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: User will not see travel module in plan details page
    Given user does not have vivo travel in the plans
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.icon" icon is displayed
      And the "travel.title" textfield with "Vai pra fora do Brasil?" text is displayed
      And the "travel.subtitle" textfield with "Aproveite o roaming internacional" text is displayed

  @jira.QANOV-453408 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @regression
  @vivobr
  Scenario: User can access to Vivo travel screen from plan details screen from footer
    Given user has "any" vivo travel package in the plans
      And user does not have "mundo" vivo travel package
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "travel.upgrade_link" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-453409 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: User can access to Vivo travel screen from plan details screen
    Given user has "any" vivo travel package in the plans
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "travel" card
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-453410 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User can access to meatball menu screen from Vivo travel module in plan details page
    Given user has "any" vivo travel package in the plans
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "travel.meatball_menu" button
     Then the "Meatball Menu" page is displayed
      And the "meatball_menu_entrypoint_list" list is displayed

  @jira.QANOV-605494 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @smoke @vivobr
  Scenario: User can see footer in vivo travel card in plan details page
    Given user has "any" vivo travel package in the plans
      And user does not have "mundo" vivo travel package
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.upgrade_text" textfield with "Vai viajar pra outro lugar?" text is displayed
      And the "travel.upgrade_link" link with "Adicionar regiões" text is displayed

  @jira.QANOV-605495 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @regression
  @vivobr
  Scenario: User can not see footer in vivo travel card in plan details page
    Given user has "any" vivo travel package in the plans
      And user has "mundo" vivo travel package
      And user has the "travel-card" module configured in CMS for "TBD" page
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "travel" card is displayed
      And the "travel.footer" element is not displayed

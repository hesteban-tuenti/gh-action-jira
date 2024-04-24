# -*- coding: utf-8 -*-
@jira.QANOV-324872
Feature: Movistar Plus Module

  Actions Before the Feature:
    Given user is in the "Start" page
      And user has the "featured-shows" module configured in CMS for "start" page
      And pulls down the page to refresh
      And the "Start" page is displayed


  @jira.QANOV-298201 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @automatic @mobile @moves @sanity @next @live @cert2 @webapp @qa
  Scenario: A telco user lands into the start tab: a module will be shown with a Movistar+ card
    Given user has a "telco" account type
      And user has a "fusion;pikolin" plan
      And user has show recommendations
      And user is in the "Start" page
      And waits until the "featured_shows" element is visible
     Then each element in the "featured_shows.carousel" list has the "image" field

  @jira.QANOV-324873 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: A telco user with the Movistar+ app installed taps on a film in the "Movistar+" card: the user will be redirected to the movie content detail on the Movistar+ app
    Given user has a "telco" account type
      And user has a "fusion;pikolin" plan
      And user has show recommendations
      And user has installed the "Movistar plus" app
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "image" field of "new_movistar_plus.list" list with "1" index
     Then the "Movistar plus" app is displayed
      And the selected film card is displayed on the Movistar+ app

  @jira.QANOV-324874 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @smoke
  Scenario: A telco user with the Movistar+ app NOT installed taps on a film in the "Movistar+" card: the user will be redirected to the movie content detail on the NATIVE BROWSER
    Given user has a "telco" account type
      And user has a "fusion;pikolin" plan
      And user has show recommendations
      And user has not installed the "Movistar plus" app
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When stores the attribute "alt" from the "image" field of "new_movistar_plus.list" list with "1" index
      And clicks on the "image" field of "new_movistar_plus.list" list with "1" index
      And I wait "3" seconds
     Then the external webview is displayed
      And the "film_name" textfield with "[CONTEXT:image]" text is displayed
      And clicks on the native "back" button
      And the "Start" page is displayed

  @jira.QANOV-386114 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-319568 @manual @mobile @moves @regression
  Scenario: A telco user without film recommendations will not see the "Movistar+" cards
    Given user has a "telco" account type
      And user has a "fusion;pikolin" plan
      And user does not have show recommendations
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "new_movistar_plus" module is not displayed

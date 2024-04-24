# -*- coding: utf-8 -*-
@jira.QANOV-386868
Feature: Coliving Experiences


  @jira.QANOV-386869 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-376900 @manual @mobile @sanity
  @vivobr
  Scenario: Vivo user can see the new experience in Novo App
    Given user is in the "Splash Screen" page
      And user is eligible for the new app
     When clicks on the "start_now" button
     Then user sees new login app experience

  @jira.QANOV-386870 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-376900 @manual @mobile @sanity
  @vivobr
  Scenario: Vivo user can see information screen about the new experience in Novo App
    Given user is already logged with app closed
      And user is eligible for the new app
     When launches the app
     Then the "App Improving Screen" page is displayed
      And the Novo App experience is loaded correctly
      And the "App Improving Screen" page is dismiss

  @jira.QANOV-386871 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-376900 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user can access to old login experence from Splash screen
    Given user is in the "Splash Screen" page
      And user is not eligible for the new app
     When clicks on the "start_now" button
     Then user sees old login app experience

  @jira.QANOV-386872 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-376900 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user can see old experience when open the app
    Given user is already logged with app closed
      And user is not eligible for the new app
     When launches the app
     Then user sees the old Vivo experience

# -*- coding: utf-8 -*-
@jira.QANOV-376057
Feature: ESIM Module


  @jira.QANOV-376059 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: A user that has an eSIM compatible device will see the module in the dashboard
    The eSIM module should be a card in the hightlight service module.
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user has a device with eSIM capabilities
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "snapcard_esim_card" card is displayed
      And the "snapcard_esim_card.esim_icon" icon is displayed
      And the "snapcard_esim_card.title" textfield is displayed

  @jira.QANOV-376060 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @smoke @vivobr
  @old_app
  Scenario: A user that has not an eSIM compatible device will not see the module in the dashboard
    The eSIM module should be a card in the hightlight service module.
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user does not have a device with eSIM capabilities
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "snapcard_esim_card" card is not displayed

  @jira.QANOV-376061 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-370138 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: A user that has an eSIM compatible device will see Aura page
    The eSIM module should be a card in the hightlight service module.
    User is redirected to Aura chat
    Given user has any "beatrix;multivivo;convergente;control_n;jeri prepay;legacy prepay" account types
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has any "platinum;V" segmentation
      And user has a device with eSIM capabilities
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "snapcard_esim_card" card
     Then the internal webview with the "Ativar eSIM" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-453383
Feature: About plan module


  @jira.QANOV-453384 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @sanity
  @vivobr
  Scenario: User can see about plan module in plan details page
    Given user has any "convergente;multivivo;jeri postpay;jeri control;legacy postpay;legacy control;control_n;beatrix postpay;beatrix control" account types
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "about_plan" module is displayed
      And the "about_plan.title" textfield is displayed
      And the "about_plan.info" textfield with "Valor mensal" text is displayed
      And the "about_plan.price" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "about_plan.link" link is displayed

  @jira.QANOV-453385 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @sanity
  @vivobr
  Scenario: Prepay user with promotion activated can see about plan module in plan details page
    Given user has any "jeri prepay;legacy prepay" account types
      And user has promotion in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "about_plan" module is displayed
      And the "about_plan.title" textfield is displayed
      And the "about_plan.info_promotion_text" textfield with "Promoção" text is displayed
      And the "about_plan.info_promotion" textfield is displayed
      And the "about_plan.price_text" textfield with "Valor" text is displayed
      And the "about_plan.price" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "about_plan.date_text" textfield with "Duração" text is displayed
      And the "about_plan.date" textfield with "\d? dias" text is displayed
      And the "about_plan.link" link is displayed

  @jira.QANOV-453387 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: Prepay user with promotion deactivated can see about plan module in plan details page
    Given user has any "jeri prepay;legacy prepay" account types
      And user has promotion in "deactive" status
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "about_plan" module is displayed
      And the "about_plan.title" textfield is displayed
      And the "about_plan.info_promotion_text" textfield with "Promoção" text is displayed
      And the "about_plan.info_promotion" textfield is displayed
      And the "about_plan.plan_text" textfield with "Pré Diário" text is displayed
      And the "about_plan.plan_status" textfield is displayed
      And the "about_plan.price_text" textfield with "Valor mínimo" text is displayed
      And the "about_plan.price" textfield with "R\$ -?\d+(?:.\d+)*,\d\d/dia" text is displayed
      And the "about_plan.internet_text" textfield with "Internet" text is displayed
      And the "about_plan.internet" textfield with "\d+ (MB|GB)" text is displayed
      And the "about_plan.minutes_text" textfield with "Ligações para Vivo" text is displayed
      And the "about_plan.minutes" textfield is displayed
      And the "about_plan.link" link is displayed

  @jira.QANOV-453388 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @sanity
  @vivobr
  Scenario: User can access to about plan screen from plan details screen
    Given user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "about_plan.link" link
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-453389 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual
  @mobile @smoke @vivobr
  Scenario: User without vivo travel can access to Vivo travel screen from plan details screen
    Given user has any "convergente;multivivo;jeri;legacy;beatrix,control_n" account types
      And user does not have vivo travel in the plans
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "travel_empty_case" card
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

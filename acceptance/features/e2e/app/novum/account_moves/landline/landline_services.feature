# -*- coding: utf-8 -*-
@jira.QANOV-325835
Feature: Landline services

  Actions Before the Feature:
    Given user has a "landline" product


  @jira.QANOV-325836 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User can access to the landline management entrypoint
    Given user has the "subscription-description" module configured in CMS for "landline" page for the "landline" product
      And user has the "services-summary" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
      And clicks on the "services.landline_management" entrypoint
     Then the browser webview with "Área privada Movistar" text in the header is displayed
      And the "Bloquear llamadas salientes" string in browser is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Landline Dashboard" page is displayed

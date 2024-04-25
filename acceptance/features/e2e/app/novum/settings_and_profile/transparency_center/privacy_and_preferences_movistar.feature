# -*- coding: utf-8 -*-
@jira.QANOV-8216
Feature: Privacy and preferences Movistar

  Actions Before each Scenario:
    Given user is in the "Privacy Preferences" page


  @jira.QANOV-8217 @android @automatic @cert2 @ios @jira.cv.11.6 @jira.link.detects.MOVES-4890 @ber
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.relates_to.NOV-161253 @live @mobile @moves @next @sanity
  Scenario: TELCO user can see his/her consents
    Given user has a "telco" account type
     When clicks on the "privacy_preferences_movistar_entrypoint" entrypoint
     Then the "Privacy Preferences Movistar" internal webview is displayed
      And the "Preferencias de privacidad" header is displayed
      And waits until the "loading_spinner" element is not visible
      And the "consents_list" list is displayed
      And each element in the "consents_list" list has the "title" field
      And each element in the "consents_list" list has the "description" field
      And each element in the "consents_list" list has the "link" field with "Más info" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Privacy Preferences" page is displayed

# -*- coding: utf-8 -*-
@jira.QANOV-126737
Feature: Smart Actions


  @jira.QANOV-2200 @no_automatable @impeded_legacy @android @ios @mobile @jira.cv.11.11
  @jira.link.depends_on.QANOV-2194 @moves @regression
  Scenario: ADMIN Legados prepay user taps on the "Cambiar tarifa" button: external page to change tariff is displayed
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legacy-prepay" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "smart_actions.change_tariff" button
     Then the browser webview is displayed
      And the "Cambiar tarifa" header is displayed

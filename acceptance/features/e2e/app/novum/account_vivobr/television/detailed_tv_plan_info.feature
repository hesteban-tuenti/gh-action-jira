# -*- coding: utf-8 -*-
@jira.QANOV-21840
Feature: Detailed TV plan info

  Actions Before each Scenario:
    Given user has a "admin" role
      And user does not have a "tv" plan


  @jira.QANOV-5018 @android @ios @mobile @jira.cv.12.0 @automatic @jira.link.parent_test_plan.QANOV-21791
  @live @next @vivobr @smoke @old_app
  Scenario: User can see TV product included in the plan
    Given user has a "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "tv.icon" icon is displayed
      And the "tv.label" textfield with "TV" text is displayed

  @jira.QANOV-5019 @android @ios @mobile @jira.cv.12.0 @automatic @jira.link.parent_test_plan.QANOV-21791
  @vivobr @regression @live @next @old_app
  Scenario: User without TV product cannot see the TV icon in dashboard
    Given user does not have "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "tv.icon" icon is not displayed
      And the "tv.label" textfield is not displayed

  @jira.QANOV-77651 @ber @android @ios @mobile @jira.cv.13.1 @automatic @jira.link.depends_on.QANOV-5018
  @jira.link.parent_test_plan.QANOV-76707 @vivobr @sanity @live @next @qa @jira.link.detects.VIVO-2979 @old_app
  Scenario: User can access to the TV dashboard
    Given user has a "tv" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "tariff-header" module configured in CMS for "tv" page for the "tv" product
      And user has the "services-summary" module configured in CMS for "tv" page for the "tv" product
      And user has the "support" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Account" page
     When clicks on the "tv.icon" entrypoint
     Then the "Television" page is displayed
      And the "TV" header is displayed
      And the "tv_products" module is displayed
      And the "tv_products.plan_name" textfield is displayed
      And the "tv_services_module.titles" list is displayed
      And the "diagnostics_module.module_title" textfield is displayed
      And the "diagnostics_module.title" textfield is displayed
      And the "diagnostics_module.description" textfield is displayed
      And the "diagnostics_module.link" button is displayed

  @jira.QANOV-21841 @android @ios @mobile @jira.cv.12.4 @manual @jira.link.depends_on.QANOV-5018
  @jira.link.parent_test_plan.QANOV-56585 @vivobr @smoke @impeded_mock @automation.pending_mock @old_app
  Scenario: User with pending installation can access to the TV dashboard
    Given user has a "tv" product in "pending" status
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "tv" page for the "tv" product
      And user has the "dynamic-content-empty-case" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Account" page
     When clicks on the "tv.icon" entrypoint
     Then the "Television" page is displayed
      And the "TV" header is displayed
      And the "pending_installation_title" textfield with "Vamos instalar seu Vivo TV em breve" text is displayed
      And the "pending_installation_subtitle" textfield with "Você pode ver todos os detalhes acompanhando a instalação" text is displayed
      And the "plan_configuration_button" button with "Acompanhar" text is displayed

  @jira.QANOV-21842 @android @ios @mobile @jira.cv.12.0 @automatic @jira.link.depends_on.QANOV-21841
  @jira.link.depends_on.QANOV-5020 @jira.link.parent_test_plan.QANOV-21791 @live @next @vivobr @regression @old_app
  Scenario: User can go back to main account dashboard from the TV dashboard
    Given user has a "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Account" page is displayed

  @jira.QANOV-21843 @android @ios @mobile @jira.cv.12.4 @manual @jira.link.depends_on.QANOV-21841
  @jira.link.parent_test_plan.QANOV-56585 @vivobr @smoke @impeded_mock @automation.pending_mock @old_app
  Scenario: User with pending installation can access to Acompanhar instalação page when taps on "Acompanhar instalação" button
    Given user has a "tv" product in "pending" status
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "tv" page for the "tv" product
      And user has the "dynamic-content-empty-case" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "plan_configuration_button" button
     Then the internal webview with "Suporte Técnico" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Fixo" page is displayed

  @jira.QANOV-77653 @android @ios @mobile @jira.cv.13.1 @automatic @jira.link.depends_on.QANOV-77651
  @jira.link.parent_test_plan.QANOV-76707 @vivobr @smoke @next @live @old_app
  Scenario: User with tv product can access to the "Support" service
    Given user has a "tv" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "tariff-header" module configured in CMS for "tv" page for the "tv" product
      And user has the "services-summary" module configured in CMS for "tv" page for the "tv" product
      And user has the "support" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "diagnostics_module.link" button
     Then the internal webview with "Suporte Técnico" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Television" page is displayed

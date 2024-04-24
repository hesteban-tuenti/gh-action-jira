# -*- coding: utf-8 -*-
@jira.QANOV-127763
Feature: General Services


  @jira.QANOV-21859 @android @ios @mobile @jira.cv.11.12 @jira.link.parent_test_plan.QANOV-21050
  @moves @regression @no_automatable @impeded_legacy
  Scenario: Legados user with all the services will see all the services entry points
    other_affected_versions="2020-38 2021-03 2022-03"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a "fusion" plan
      And user has a "mobile_line" product
      And user has the "conexion_segura" service in "any" status
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "any_mobile_line" link
     Then the "Mobile Line Dashboard" page is displayed
      And the "services_module" module is displayed

  @jira.QANOV-22347 @android @ios @mobile @jira.cv.11.12
  @jira.link.parent_test_plan.QANOV-21050 @moves @regression @no_automatable @impeded_legacy
  Scenario: Legados postpay MONOLINE user will see the higlighted services
    other_affected_versions="2020-38 2021-03 2022-03"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a "monoline" plan
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "services_module" module is displayed

  @jira.QANOV-59904 @android @ios @mobile @jira.cv.11.12
  @jira.link.parent_test_plan.QANOV-21050 @moves @regression @no_automatable @impeded_legacy
  Scenario: Legados prepay MONOLINE user will see the higlighted services
    other_affected_versions="2020-38 2021-03 2022-03"
    Given user has a "legado prepay" account type
      And user has a "admin" role
      And user has a "monoline" plan
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "services_module" module is displayed

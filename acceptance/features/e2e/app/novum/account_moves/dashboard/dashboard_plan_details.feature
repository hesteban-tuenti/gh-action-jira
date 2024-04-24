# -*- coding: utf-8 -*-
@jira.QANOV-7113
Feature: Dashboard plan details


  @jira.<jira_id> @android @ios @jira.cv.12.3 @jira.link.depends_on.QANOV-7120 @mobile @moves @regression
  Scenario Outline: <account_type> ADMIN-LIGHT user with <plan> plan taps on the "Cambiar tarifa" button: Login Escalation Required page is displayed
    other_affected_versions="2020-48"
    Given user has a "<account_type>" account type
      And user has a "admin-light" role
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "tariff_details.button_change" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para acceder a esta información introduce el documento del titular y contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

    @no_automatable @impeded_legacy
    Examples:
          | account_type   | plan           | cms_module               | jira_id     |
          | legado postpay | fusion;conecta | agreement-details-legado | QANOV-75195 |

  @jira.QANOV-7154 @android @ios @jira.cv.10.4 @jira.link.detects.ACCOUNT-13901 @jira.link.detects.MOVES-4624
  @jira.link.relates_to.NOV-47897 @no_automatable @mobile @moves @smoke
  Scenario: Legados postpay ADMIN FUSION user selects a plan: "Tu tarifa" section will be shown
    internal_checkpoint="
    IMPORTANT: Only some Legados users can see the "Tu tarifa actual" link due to OB API responses."
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has the matching subscription selected in the account
      And user has the "agreement-details-legado" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "tariff_details.title" textfield with "TU TARIFA" text is displayed
      And the "tariff_details.plan_name" textfield is displayed
      And the "tariff_details.button_change" button with "Cambiar tarifa" text is displayed

  @jira.QANOV-59897 @android @ios @jira.cv.12.1 @jira.link.depends_on.QANOV-7120 @no_automatable @mobile @moves @regression
  Scenario: Legados postpay ADMIN FUSION user taps on the "Cambiar tarifa" button: Browser SSO webview is displayed
    other_affected_versions="2020-48"
    Given user has a "legado postpay" account type
      And user has a "admin" role
      And user has a "fusion" plan
      And user has the matching subscription selected in the account
      And user has the "agreement-details-legado" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "tariff_details.button_change" button
     Then the internal webview is displayed
      And the header that contains the "Configurador miMovistar" text is displayed

  @jira.QANOV-7192 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-127725
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: Legado prepay ADMIN cannot see "Tu tarifa" section
    Given user has a "legado prepay" account type
      And user has a "any_admin" role
      And user has the matching subscription selected in the account
      And user has the "agreement-details-legado" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "tariff_details.title" textfield is not displayed
      And the "tariff_details.plan_name" textfield is not displayed
      And the "tariff_details.tariff_information" link is not displayed

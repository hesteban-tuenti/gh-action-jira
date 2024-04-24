@jira.QANOV-21830
Feature: Detailed landline plan info

  Actions Before each Scenario:
    Given user has a "admin" role
      And user does not have a "landline" plan


  @jira.QANOV-21831 @android @ios @mobile @jira.cv.12.0 @automatic @jira.link.parent_test_plan.QANOV-21791
  @vivobr @sanity @live @next @qa @webapp @old_app
  Scenario: User can see Landline product included in the plan
    Given user has a "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "landline_icon" icon is displayed
      And the "landline_label" textfield with "Fixo" text is displayed

  @jira.QANOV-21832 @android @ios @mobile @jira.cv.12.0 @automatic @jira.link.parent_test_plan.QANOV-21791
  @vivobr @regression @live @next @qa @webapp @old_app
  Scenario: A user without Landline product cannot see the Landline icon in dashboard
    Given user does not have "landline" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "landline_icon" icon is not displayed
      And the "landline_label" textfield is not displayed

  @jira.QANOV-21833 @android @ios @mobile @jira.cv.12.4 @manual @jira.link.depends_on.QANOV-21831
  @jira.link.parent_test_plan.QANOV-56585 @vivobr @smoke @automation.pending_mock @impeded_mock @old_app
  Scenario: User with pending installation can access to the Landline dashboard
    User (Live): 02216780936
    Given user has a "landline" product in "pending" status
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the "landline" product
      And user has the "dynamic-content-empty-case" module configured in CMS for "dashboard" page for the "landline" product
      And user is in the "Account" page
     When clicks on the "landline_icon" entrypoint
     Then the "Landline" page is displayed
      And the "Fixo" header is displayed
      And the "pending_installation_title" textfield with "Vamos instalar seu Vivo Fixo em breve" text is displayed
      And the "pending_installation_subtitle" textfield with "Você pode ver todos os detalhes acompanhando a instalação" text is displayed
      And the "plan_configuration_button" button with "Acompanhar" text is displayed

  @jira.QANOV-21835 @android @ios @mobile @jira.cv.12.4 @manual @jira.link.depends_on.QANOV-21833
  @jira.link.parent_test_plan.QANOV-56585 @vivobr @smoke @automation.pending_mock @impeded_mock @old_app
  Scenario: User with pending installation can access to Acompanhar instalação page when taps on "Acompanhar instalação" button
    User (Live): 02216780936
    Given user has a "landline" product in "pending" status
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the "landline" product
      And user has the "dynamic-content-empty-case" module configured in CMS for "dashboard" page for the "landline" product
      And user is in the "Landline" page
     When clicks on the "plan_configuration_button" button
     Then the internal webview is displayed
      And the "Suporte Técnico" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Fixo" page is displayed

  @jira.QANOV-21836 @ber @android @ios @mobile @jira.cv.12.0 @automatic
  @jira.link.depends_on.QANOV-21831 @jira.link.detects.VIVO-2252 @jira.link.detects.VIVO-2253 @jira.link.detects.NOVUMCC-4505
  @jira.link.detects.VIVO-2509 @jira.link.parent_test_plan.QANOV-21791 @jira.link.parent_test_plan.QANOV-66163 @vivobr
  @smoke @live @next @old_app
  Scenario: User can access to the Landline dashboard
    Given user has a "landline" product in "active" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "landline_icon" icon
     Then the internal webview with "Detalhe do plano" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

Feature: Access to Mis tokens

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.QANOV-313519 @moves @android @ios @jira.cv.14.0 @mobile @smoke @manual
  Scenario: User can access to Mis Tokens from the categories carousel
    Given user belongs to the "ob_telco;landline;role-admin" audiences
     When opens the "Mis Tokens" Explore category
     Then the internal webview is displayed
      And the "tokens" string in internal webview is displayed


  @jira.QANOV-313520 @moves @android @ios @jira.cv.14.0 @mobile @regression @manual
  Scenario: User who doesn't belong to the configured audiences can't access to Mis Tokens
    Given user doesn't belong to the "ob_telco;landline;role-admin" audiences
     Then the "Mis Tokens" category is not displayed in the categories carousel

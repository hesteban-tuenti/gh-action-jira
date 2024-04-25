Feature: Jenkins test feature


  @jira.DONT_UPLOAD @client.web @execution_mode.automatic @moves @o2uk
  @vivobr @smoke @sanity @regression
  Scenario: Test
    Given I go to "[CONF:web_uri]" web page
      And the "Login" page is loaded

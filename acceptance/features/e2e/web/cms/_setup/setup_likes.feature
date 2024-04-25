Feature: Setup Likes


  @jira.DONT_UPLOAD @web @automatic @moves @smoke @sanity @regression @dev @qa
  Scenario: Environment selection and login
    Given I go to "[CONF:cms.base][CONF:cms.loyalty]" web page
    And the "Login" page is loaded
    And logs in the loyalty cms

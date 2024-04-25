Feature: Setup


  @jira.DONT_UPLOAD @web @automatic @moves @o2uk @vivobr @blaude @o2de
  @smoke @sanity @regression @dev @qa @ber
  Scenario: Environment selection and login
    Given I go to "[CONF:cms.base]" web page
      And the "Login" page is loaded
      And logs in the cms

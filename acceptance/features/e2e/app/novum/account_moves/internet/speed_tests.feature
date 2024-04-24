@jira.QANOV-8521
Feature: Speed tests

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product

  @jira.QANOV-8526 @android @ios @mobile @jira.cv.10.4 @automatic @jira.link.relates_to.NOV-47916
  @moves @sanity @ber @qa @next @cert2 @live @webapp
  Scenario: User sees properly the "Test de velocidad" screen
    commented_tags="@depends_on.NOV-47924 @depends_on.NOV-82053 @depends_on.NOV-83659"
    other_affected_versions="2022-04"
    Given user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary-internet" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Internet Dashboard" page
     When clicks on the "internet_speed" entrypoint
     Then the "Speed Test" page is displayed
      And the "Test de Velocidad" header is displayed
      And the "info_icon" icon is displayed
      And the "content" textfield is displayed
      And the "calculate_speed" button is displayed

  @jira.QANOV-8533 @ios @android @mobile @jira.cv.10.4 @automatic @jira.link.depends_on.QANOV-8526
  @jira.link.relates_to.NOV-47917 @moves @smoke @ber @qa @next @cert2 @live
  Scenario: User can access to the screen to perform the speed test
    other_affected_versions="2022-04"
    Given user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "services-summary-internet" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Speed Test" page
     When clicks on the "calculate_speed" button
     Then the internal webview with "Test de Velocidad" header is displayed
      And the "Test de Velocidad" string is displayed

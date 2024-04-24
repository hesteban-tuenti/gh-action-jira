@jira.QANOV-7594
Feature: Payment due date bill is available for download and payment


  @jira.QANOV-7595 @android @ios @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-52622 @moves
  @regression @impeded_mock @automation.hard
  Scenario: A user with admin-light role doesn't receive billing notification when the bill is ready
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And billing information is available
     Then doesn't receive a "bill_is_ready" notification

  @jira.QANOV-7597 @android @ios @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-52624
  @moves @regression @impeded_mock @automation.hard
  Scenario: An admin user receives billing notification when the bill is ready
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And billing information is available
     Then receives a "bill_is_ready" notification

  @jira.QANOV-7598 @android @ios @mobile @jira.cv.10.5 @manual @jira.link.depends_on.QANOV-7597
  @jira.link.relates_to.NOV-52623 @moves @smoke @impeded_mock @automation.hard @har
  Scenario: An admin user is redirected to billing screen after tapping on a received billing notification
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has a "bill_is_ready" notification
     When clicks on the "bill_is_ready" notification
     Then the "Bills" page is displayed
      And the "bill_is_ready" notification is not displayed

  @jira.QANOV-7599 @android @ios @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-52625
  @moves @regression @impeded_mock @automation.hard
  Scenario: An admin user receives billing notification when the bill is ready
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And billing information is available
      And user turns on the Airplane mode
     When turns off the Airplane mode
     Then receives a "bill_is_ready" notification

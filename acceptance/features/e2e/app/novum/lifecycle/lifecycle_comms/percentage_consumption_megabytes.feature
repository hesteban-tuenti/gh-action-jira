@jira.QANOV-7694
Feature: Percentage consumption megabytes


  @jira.<jira_id> @android @ios @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-52619 @moves
  @regression @automation.hard
  Scenario Outline: <account_type> admin user receives consumption notification when data threshold is reached for every line
    internal_checkpoint="NOTE: repeat scenario for every available line"
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has consumed "<percentage_consumed>" of the "data" allowance in the "mobile_line" product
     Then receives a "<notification_type>" notification

    Examples:
      | account_type  | percentage_consumed | notification_type           | jira_id    |
      | postpay       | 80%                 | 80_data_mobile_consumption  | QANOV-7695 |
      | postpay       | 100%                | 100_data_mobile_consumption | QANOV-7696 |
      | legado prepay | 80%                 | 80_data_mobile_consumption  | QANOV-7697 |
      | legado prepay | 100%                | 100_data_mobile_consumption | QANOV-7698 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.5 @manual @jira.link.depends_on.QANOV-7698
  @jira.link.relates_to.NOV-52620 @moves @regression @automation.hard
  Scenario Outline: <account_type> admin user is redirected to the Account screen after tapping on a received consumption notification
    internal_checkpoint="NOTE: repeat scenario for every available line"
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has consumed "<percentage_consumed>" of the "data" allowance in the "mobile_line" product
      And has a "<notification_type>" notification
     When clicks on the "<notification_type>" notification
     Then the "Account" page is displayed
      And the "<notification_type>" notification is not displayed

    Examples:
      | account_type  | percentage_consumed | notification_type           | jira_id    |
      | postpay       | 80%                 | 80_data_mobile_consumption  | QANOV-7699 |
      | postpay       | 100%                | 100_data_mobile_consumption | QANOV-7700 |
      | legado prepay | 80%                 | 80_data_mobile_consumption  | QANOV-7701 |
      | legado prepay | 100%                | 100_data_mobile_consumption | QANOV-7702 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-53569 @moves
  @regression @impeded_mock @automation.hard
  Scenario Outline: A user with admin-light role receives consumption notification when data threshold is reached on the current line
    Given user has a "postpay" account type
      And user has a "admin-light" role
      And user has a "mobile_line" product
      And user has consumed "<percentage_consumed>" of the "data" allowance in the "current_logged_mobile_line" product
     Then receives a "<notification_type>" notification

    Examples:
      | percentage_consumed | notification_type           | jira_id    |
      | 80%                 | 80_data_mobile_consumption  | QANOV-7703 |
      | 100%                | 100_data_mobile_consumption | QANOV-7704 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.5 @manual @jira.link.depends_on.QANOV-7706
  @jira.link.relates_to.NOV-53570 @moves @<priority> @impeded_mock @automation.hard
  Scenario Outline: A user with admin-light role is redirected to Account screen after tapping on a received consumption notification on the current line
    Given user has a "postpay" account type
      And user has a "admin-light" role
      And user has a "mobile_line" product
      And user has consumed "<percentage_consumed>" of the "data" allowance in the "current_logged_mobile_line" product
      And has a "<notification_type>" notification
     When clicks on the "<notification_type>" notification
     Then the "Account" page is displayed
      And the "<notification_type>" notification is not displayed

    @har
    Examples:
      | percentage_consumed | notification_type           | priority   | jira_id    |
      | 100%                | 100_data_mobile_consumption | smoke      | QANOV-7708 |

    Examples:
      | percentage_consumed | notification_type           | priority   | jira_id    |
      | 80%                 | 80_data_mobile_consumption  | regression | QANOV-7707 |

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-53571
  @moves @regression @impeded_mock @automation.hard
  Scenario Outline: A user with admin-light role doesn't receive consumption notification when data threshold is reached on different line than the logged one
    Given user has a "postpay" account type
      And user has a "admin-light" role
      And user has a "mobile_line" product
      And user has consumed "<percentage_consumed>" of the "data" allowance in the "non_logged_mobile_line" product
     Then doesn't receive a "<notification_type>" notification

    Examples:
      | percentage_consumed | notification_type           | jira_id    |
      | 80%                 | 80_data_mobile_consumption  | QANOV-7711 |
      | 100%                | 100_data_mobile_consumption | QANOV-7712 |

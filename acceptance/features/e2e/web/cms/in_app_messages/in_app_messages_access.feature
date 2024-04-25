# -*- coding: utf-8 -*-
@jira.QANOV-4448 @not_hardening
Feature: In-App Messages Access

  @jira.<jira_id> @<product> @automatic @jira.cv.11.6 @jira.link.relates_to.NOV-174716 @qa @sanity @web @ber
  Scenario Outline: An editor can access to "In-app messages" section
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given there are in-app messages configured in CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
     Then the "In App Messages" page is loaded
      And waits until the "in_app_messages_list" list is displayed
      And each item in the "in_app_messages_list" list has the "name" field
      And each item in the "in_app_messages_list" list has the "audience" field
      And each item in the "in_app_messages_list" list has the "view_type" field
      And each item in the "in_app_messages_list" list has the "created" field
      And each item in the "in_app_messages_list" list has the "end" field
      And each item in the "in_app_messages_list" list has the "status" field
      And the text of the element "filter_by_status_button" is equal to "Filter by status"
      And the text of the element "filter_by_type_button" is equal to "Filter by type"
      And the text of the element "create_in_app_button" is equal to "Create"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4449   |
          | moves   | QANOV-4450   |
          | o2uk    | QANOV-4451   |
          | blaude  | QANOV-446842 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-174718 @manual
  @regression @web
  Scenario Outline: An editor can filter the in-app messages created by status
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And I click on the "filter_by_status_button" button
      And I click on the "<status_filter>" button
     Then each element in the "in_app_messages_list_status" list has the "status" field with "<status_filter>" text

    Examples:
          | status_filter | product | depends_on | jira_id      |
          | None          | vivobr  | QANOV-4449 | QANOV-4452   |
          | None          | moves   | QANOV-4450 | QANOV-4453   |
          | None          | o2uk    | QANOV-4451 | QANOV-4454   |
          | None          | blaude  |            | QANOV-446843 |
          | Published     | vivobr  | QANOV-4449 | QANOV-4455   |
          | Published     | moves   | QANOV-4450 | QANOV-4456   |
          | Published     | o2uk    | QANOV-4451 | QANOV-4457   |
          | Published     | blaude  |            | QANOV-446844 |
          | Draft         | vivobr  | QANOV-4449 | QANOV-4458   |
          | Draft         | moves   | QANOV-4450 | QANOV-4459   |
          | Draft         | o2uk    | QANOV-4451 | QANOV-4460   |
          | Draft         | blaude  |            | QANOV-446845 |
          | Paused        | vivobr  | QANOV-4449 | QANOV-4461   |
          | Paused        | moves   | QANOV-4450 | QANOV-4462   |
          | Paused        | o2uk    | QANOV-4451 | QANOV-4463   |
          | Paused        | blaude  |            | QANOV-446846 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-174804 @manual
  @regression @web
  Scenario Outline: An editor can see the summary of a created In-App Message
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And I press the element in position 1 in the elements list "in_app_messages_list"
     Then the "In App Messages Details" page is loaded

    Examples:
          | product | depends_on | jira_id      |
          | vivobr  | QANOV-4449 | QANOV-4467   |
          | moves   | QANOV-4450 | QANOV-4468   |
          | o2uk    | QANOV-4451 | QANOV-4469   |
          | blaude  |            | QANOV-446847 |

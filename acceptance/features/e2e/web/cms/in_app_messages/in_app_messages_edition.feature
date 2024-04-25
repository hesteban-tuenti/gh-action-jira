# -*- coding: utf-8 -*-
@jira.QANOV-4470 @not_hardening
Feature: In-App Messages Edition


  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.relates_to.NOV-174727 @manual @regression @web
  Scenario Outline: An editor can remove an In-App Message
    commented_tags="@depends_on.NOV-174729"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "any" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And I press the element in position 1 in the elements list "three_dot_list"
      And I click on the "delete" button
      And I fill in the "in_app_title" field with "Test"
      And I click on the "delete" button
     Then the "in_app_messages_list" list of elements is displayed
      And the text of the element "confirmation_message" is equal to "The message has been deleted"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4471   |
          | moves   | QANOV-4472   |
          | o2uk    | QANOV-4473   |
          | blaude  | QANOV-446884 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-554878 @jira.link.relates_to.NOV-174729
  @manual @smoke @web
  Scenario Outline: An editor can pause a published In-App Message
    commented_tags="@depends_on.NOV-174716"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "published" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "status" field with "Published" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "pause" button
     Then the "in_app_messages_list" list of elements is displayed
      And the element in "[CONTEXT:in_app_message_index]" position in the "in_app_messages_list" list has the "status" textfield with the "Paused" text
      And the text of the element "confirmation_message" is equal to "The message has been paused"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4474   |
          | moves   | QANOV-4475   |
          | o2uk    | QANOV-4476   |
          | blaude  | QANOV-446885 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-554878 @jira.link.relates_to.NOV-174775
  @manual @regression @web
  Scenario Outline: An editor can unpause a paused In-App Message
    commented_tags="@depends_on.NOV-174729"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "paused" status in the CMS
      And the value of "1" cell of table "in_app_messages_list" contains "PAUSED"
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "status" field with "Paused" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "start" button
      And the "publish_in-app_popup" element is displayed
      And I click on the "publish" button
     Then the "in_app_messages_list" list of elements is displayed
      And the element in "[CONTEXT:in_app_message_index]" position in the "in_app_messages_list" list has the "status" textfield with the "Published" text
      And the text of the element "confirmation_message" is equal to "The message has been published successfully"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4477   |
          | moves   | QANOV-4478   |
          | o2uk    | QANOV-4479   |
          | blaude  | QANOV-446886 |

  @jira.<jira_id> @<product> @automatic @ber @jira.cv.11.6 @jira.link.relates_to.NOV-174742 @qa @sanity @web
  Scenario Outline: An editor can edit an In-App Message
    commented_tags="@depends_on.NOV-174729"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "any" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages" page is loaded
      And I press the element in "1" position from "in_app_messages_list" elements list
     Then the "In App Message Overview" page is loaded
      And the "name_input" inputtext is not empty

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4480   |
          | moves   | QANOV-4481   |
          | o2uk    | QANOV-4482   |
          | blaude  | QANOV-446887 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.relates_to.NOV-174744 @manual @regression @web
  Scenario Outline: An editor can clone an In-App Message
    commented_tags="@depends_on.NOV-174729"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "any" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And I press the element in position 1 in the elements list "three_dot_list"
      And I click on the "duplicate" button
     Then the "In App Overview" page is loaded
      And the attribute "text" value for element "in_app_name" is "Name for your message"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4483   |
          | moves   | QANOV-4484   |
          | o2uk    | QANOV-4485   |
          | blaude  | QANOV-446888 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-519389 @manual @regression @web @e2e
  Scenario Outline: An editor can edit an Linked In-App Message and see the url
    WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given user has ">=1" "Linked" In-App Messages in "any" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages" page is loaded
      And I select the "Linked" option from "filter_by_type_button" field
      And I click on the "edit" field on the "0" element in the "in_app_messages_list" web list
      And the "In App Message Overview" page is loaded
      And I click on the "continue" button
      And the "In App Message Preview" page is loaded
     Then the "deeplink_text" textfield is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-519413 |
          | moves   | QANOV-519414 |
          | o2uk    | QANOV-519415 |
          | blaude  | QANOV-519416 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor can edit an in-app in Pending publication state and publish it
    commented_tags="@depends_on.NOV-174716"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "draft" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "edit" button
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
      And the "In App Messages Preview" page is loaded
      And I click on the "publish" button
     Then the "In App Messages CMS" page is loaded
      And the element in "[CONTEXT:in_app_message_index]" position in the "in_app_messages_list" list has the "status" textfield with the "Published" text
      And the text of the element "confirmation_message" is equal to "Published successfully"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570498 |
          | moves   | QANOV-570499 |
          | o2uk    | QANOV-570500 |
          | blaude  | QANOV-570501 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor can edit an in-app in Pending publication and save it as draft again
    commented_tags="@depends_on.NOV-174716"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "draft" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "status" field with "Pending publication" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "edit" button
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
      And the "In App Messages Preview" page is loaded
      And I click on the "save" button
      And the "save_in-app_draft_popup" element is displayed
      And I click on the "save_draft_button" button
     Then the "In App Messages" page is loaded
      And the element in "[CONTEXT:in_app_message_index]" position in the "in_app_messages_list" list has the "status" textfield with the "Pending publication" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570502 |
          | moves   | QANOV-570503 |
          | o2uk    | QANOV-570504 |
          | blaude  | QANOV-570505 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor can edit an in-app in Published state but cannot save it as draft
    commented_tags="@depends_on.NOV-174716"
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
    Given user has ">=1" In-App Messages in "draft" status in the CMS
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages CMS" page is loaded
      And stores the index of the "status" field with "Published" value in the "in_app_messages_list" list
      And I click on the "edit_in-app" field on the "[CONTEXT:in_app_messages_index]" element in the "in_app_messages_list" web list
      And I click on the "edit" button
      And the "In App Message Overview" page is loaded
     Then the "save" button is disabled

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570506 |
          | moves   | QANOV-570507 |
          | o2uk    | QANOV-570508 |
          | blaude  | QANOV-570509 |

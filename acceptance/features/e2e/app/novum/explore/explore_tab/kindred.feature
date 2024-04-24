# -*- coding: utf-8 -*-
@jira.QANOV-213850
Feature: Kindred

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @jira.link.parent_test_plan.QANOV-206624 @mobile @o2uk @sanity
  Scenario Outline: A o2uk user having device with version <os>>=<os_version> can see a Kindred card in Explore page
    Given the device version is "equal_or_greater" than "<os_version>"
      And user has any "postpay;prepay" account types
      And user belongs to the "kindred" audience
      And user has a kindred card in a Explore module
     When searches the "card"
     Then the selected explore card has the "image_or_bumper" media field displayed

    @automatic @ios @jira.cv.13.3 @qa
    Examples:
          | os_version | os    | jira_id      |
          | 15.0       | "iOS" | QANOV-213851 |

    @android @jira.cv.14.3 @manual
    Examples:
          | os_version | os        | jira_id      |
          | 6.0        | "Android" | QANOV-344959 |

  @jira.<jira_id> @jira.link.parent_test_plan.QANOV-206624 @mobile @o2uk @smoke
  Scenario Outline: A o2uk user having device with version <os>>=<os_version> can access to the link in the module with a Kindred card
    Given the device version is "equal_or_greater" than "<os_version>"
      And user has any "postpay;prepay" account types
      And user belongs to the "kindred" audience
      And user has a kindred card in a Explore module
     When searches the "card"
      And clicks on the "button_container" field in the explore "card"
     Then the Explore card is opened

    @automatic @ios @jira.cv.13.3 @qa
    Examples:
          | os_version | os    | jira_id      |
          | 15.0       | "iOS" | QANOV-213852 |

    @android @jira.cv.14.3 @manual
    Examples:
          | os_version | os        | jira_id      |
          | 6.0        | "Android" | QANOV-344960 |
